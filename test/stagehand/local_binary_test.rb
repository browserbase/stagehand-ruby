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
    @old_server_version = ENV["STAGEHAND_SERVER_VERSION"]
    @old_sea_binary = ENV["STAGEHAND_SEA_BINARY"]
    ENV["HOME"] = @tmp_home
    ENV.delete("XDG_CACHE_HOME")
    ENV.delete("LOCALAPPDATA")
    ENV.delete("STAGEHAND_SERVER_VERSION")
    ENV.delete("STAGEHAND_SEA_BINARY")
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
    ENV["STAGEHAND_SERVER_VERSION"] = @old_server_version
    ENV["STAGEHAND_SEA_BINARY"] = @old_sea_binary
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

  def test_default_downloads_patched_version_ignoring_old_cache
    cache_dir = Stagehand::Local::Binary.cache_dir
    filename = Stagehand::Local::Binary.binary_filename
    old_path = File.join(File.dirname(cache_dir), "ruby_3.21.0", filename)
    FileUtils.mkdir_p(File.dirname(old_path))
    File.binwrite(old_path, "old binary")

    url = "https://github.com/browserbase/stagehand/releases/download/stagehand-server-v3/v3.7.7/#{filename}"
    stub_request(:get, url).to_return(status: 200, body: "patched binary")

    path = Stagehand::Local::Binary.resolve_binary_path

    assert_equal(File.join(cache_dir, filename), path)
    assert_equal("patched binary", File.binread(path))
    assert_equal("old binary", File.binread(old_path))
    assert_requested(:get, url, times: 1)
  end

  def test_downloads_explicit_server_version
    ENV["STAGEHAND_SERVER_VERSION"] = "v1.2.3"
    filename = Stagehand::Local::Binary.binary_filename
    url = "https://github.com/browserbase/stagehand/releases/download/stagehand-server-v3/v1.2.3/#{filename}"
    stub_request(:get, url).to_return(status: 200, body: "selected binary")

    path = Stagehand::Local::Binary.resolve_binary_path

    assert_equal("selected binary", File.binread(path))
    assert_requested(:get, url, times: 1)
  end

  def test_uses_custom_binary_without_network
    custom_path = File.join(@tmp_home, "custom-server")
    File.binwrite(custom_path, "custom binary")
    ENV["STAGEHAND_SEA_BINARY"] = custom_path

    path = Stagehand::Local::Binary.resolve_binary_path

    assert_equal(custom_path, path)
    assert_equal("custom binary", File.binread(path))
    assert_not_requested(:get, /github\.com/)
  end

  def test_downloads_latest_tag_when_missing
    ENV["STAGEHAND_SERVER_VERSION"] = "latest"
    filename = Stagehand::Local::Binary.binary_filename

    stub_request(:get, "https://api.github.com/repos/browserbase/stagehand/releases?per_page=15")
      .to_return(status: 200, body: [{tag_name: "stagehand-server-v3/v9.9.9"}].to_json)

    stub_request(:get, "https://github.com/browserbase/stagehand/releases/download/stagehand-server-v3/v9.9.9/#{filename}")
      .to_return(status: 200, body: "binary")

    path = Stagehand::Local::Binary.resolve_binary_path

    assert(File.exist?(path))
    assert_equal("binary", File.binread(path))
  end

  def test_download_error_includes_manual_hint
    filename = Stagehand::Local::Binary.binary_filename

    stub_request(:get, "https://github.com/browserbase/stagehand/releases/download/stagehand-server-v3/v3.7.7/#{filename}")
      .to_return(status: 404, body: "not found")

    err = assert_raises(RuntimeError) { Stagehand::Local::Binary.resolve_binary_path }
    assert_includes(err.message, "Failed to download Stagehand driver binary")
    assert_includes(err.message, filename)
  end
end
