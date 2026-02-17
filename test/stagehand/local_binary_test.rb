# frozen_string_literal: true

require_relative "test_helper"

class Stagehand::LocalBinaryTest < Minitest::Test
  include WebMock::API

  @mutex = Mutex.new

  class << self
    attr_reader :mutex
  end

  def setup
    super
    @tmp_home = Dir.mktmpdir
    @old_home = Dir.home if ENV.key?("HOME")
    @old_xdg = ENV["XDG_CACHE_HOME"]
    @old_local = ENV["LOCALAPPDATA"]
    ENV["HOME"] = @tmp_home
    ENV.delete("XDG_CACHE_HOME")
    ENV.delete("LOCALAPPDATA")
    ENV.delete("STAGEHAND_SERVER_VERSION")
    WebMock.enable!
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  def teardown
    if @old_home
      ENV["HOME"] = @old_home
    else
      ENV.delete("HOME")
    end
    ENV["XDG_CACHE_HOME"] = @old_xdg
    ENV["LOCALAPPDATA"] = @old_local
    FileUtils.remove_entry(@tmp_home) if @tmp_home && File.directory?(@tmp_home)
    WebMock.reset!
    WebMock.allow_net_connect!
    super
  end

  def around
    self.class.mutex.synchronize { super }
  end

  def test_uses_cache_without_network
    cache_dir = Stagehand::Local::Binary.cache_dir
    filename = Stagehand::Local::Binary.binary_filename
    FileUtils.mkdir_p(cache_dir)
    cache_path = File.join(cache_dir, filename)
    File.binwrite(cache_path, "cached")

    path = Stagehand::Local::Binary.resolve_binary_path
    assert_equal(cache_path, path)
  end

  def test_downloads_latest_tag_when_missing
    filename = Stagehand::Local::Binary.binary_filename

    stub_request(:get, "https://api.github.com/repos/browserbase/stagehand/releases?per_page=15")
      .to_return(status: 200, body: [{tag_name: "stagehand-server/v9.9.9"}].to_json)

    stub_request(:get, "https://github.com/browserbase/stagehand/releases/download/stagehand-server/v9.9.9/#{filename}")
      .to_return(status: 200, body: "binary")

    path = Stagehand::Local::Binary.resolve_binary_path

    assert(File.exist?(path))
    assert_equal("binary", File.binread(path))
  end

  def test_download_error_includes_manual_hint
    filename = Stagehand::Local::Binary.binary_filename

    stub_request(:get, "https://api.github.com/repos/browserbase/stagehand/releases?per_page=15")
      .to_return(status: 200, body: [{tag_name: "stagehand-server/v1.2.3"}].to_json)

    stub_request(:get, "https://github.com/browserbase/stagehand/releases/download/stagehand-server/v1.2.3/#{filename}")
      .to_return(status: 404, body: "not found")

    err = assert_raises(RuntimeError) { Stagehand::Local::Binary.resolve_binary_path }
    assert_includes(err.message, "Failed to download Stagehand driver binary")
    assert_includes(err.message, filename)
  end
end
