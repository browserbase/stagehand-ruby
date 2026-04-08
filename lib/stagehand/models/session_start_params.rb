# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#start
    class SessionStartParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute model_name
      #   Model name to use for AI operations
      #
      #   @return [String]
      required :model_name, String, api_name: :modelName

      # @!attribute act_timeout_ms
      #   Timeout in ms for act operations (deprecated, v2 only)
      #
      #   @return [Float, nil]
      optional :act_timeout_ms, Float, api_name: :actTimeoutMs

      # @!attribute browser
      #
      #   @return [Stagehand::Models::SessionStartParams::Browser, nil]
      optional :browser, -> { Stagehand::SessionStartParams::Browser }

      # @!attribute browserbase_session_create_params
      #
      #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams, nil]
      optional :browserbase_session_create_params,
               -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams },
               api_name: :browserbaseSessionCreateParams

      # @!attribute browserbase_session_id
      #   Existing Browserbase session ID to resume
      #
      #   @return [String, nil]
      optional :browserbase_session_id, String, api_name: :browserbaseSessionID

      # @!attribute dom_settle_timeout_ms
      #   Timeout in ms to wait for DOM to settle
      #
      #   @return [Float, nil]
      optional :dom_settle_timeout_ms, Float, api_name: :domSettleTimeoutMs

      # @!attribute experimental
      #
      #   @return [Boolean, nil]
      optional :experimental, Stagehand::Internal::Type::Boolean

      # @!attribute model_client_options
      #   Optional provider-specific configuration for the session model (for example
      #   Bedrock region and credentials)
      #
      #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions, nil]
      optional :model_client_options,
               union: -> { Stagehand::SessionStartParams::ModelClientOptions },
               api_name: :modelClientOptions

      # @!attribute self_heal
      #   Enable self-healing for failed actions
      #
      #   @return [Boolean, nil]
      optional :self_heal, Stagehand::Internal::Type::Boolean, api_name: :selfHeal

      # @!attribute system_prompt
      #   Custom system prompt for AI operations
      #
      #   @return [String, nil]
      optional :system_prompt, String, api_name: :systemPrompt

      # @!attribute verbose
      #   Logging verbosity level (0=quiet, 1=normal, 2=debug)
      #
      #   @return [Float, Stagehand::Models::SessionStartParams::Verbose, nil]
      optional :verbose, enum: -> { Stagehand::SessionStartParams::Verbose }

      # @!attribute wait_for_captcha_solves
      #   Wait for captcha solves (deprecated, v2 only)
      #
      #   @return [Boolean, nil]
      optional :wait_for_captcha_solves, Stagehand::Internal::Type::Boolean, api_name: :waitForCaptchaSolves

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionStartParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionStartParams::XStreamResponse }

      # @!method initialize(model_name:, act_timeout_ms: nil, browser: nil, browserbase_session_create_params: nil, browserbase_session_id: nil, dom_settle_timeout_ms: nil, experimental: nil, model_client_options: nil, self_heal: nil, system_prompt: nil, verbose: nil, wait_for_captcha_solves: nil, x_stream_response: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Stagehand::Models::SessionStartParams} for more details.
      #
      #   @param model_name [String] Model name to use for AI operations
      #
      #   @param act_timeout_ms [Float] Timeout in ms for act operations (deprecated, v2 only)
      #
      #   @param browser [Stagehand::Models::SessionStartParams::Browser]
      #
      #   @param browserbase_session_create_params [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams]
      #
      #   @param browserbase_session_id [String] Existing Browserbase session ID to resume
      #
      #   @param dom_settle_timeout_ms [Float] Timeout in ms to wait for DOM to settle
      #
      #   @param experimental [Boolean]
      #
      #   @param model_client_options [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions] Optional provider-specific configuration for the session model (for example Bedr
      #
      #   @param self_heal [Boolean] Enable self-healing for failed actions
      #
      #   @param system_prompt [String] Custom system prompt for AI operations
      #
      #   @param verbose [Float, Stagehand::Models::SessionStartParams::Verbose] Logging verbosity level (0=quiet, 1=normal, 2=debug)
      #
      #   @param wait_for_captcha_solves [Boolean] Wait for captcha solves (deprecated, v2 only)
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionStartParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Browser < Stagehand::Internal::Type::BaseModel
        # @!attribute cdp_url
        #   Chrome DevTools Protocol URL for connecting to existing browser
        #
        #   @return [String, nil]
        optional :cdp_url, String, api_name: :cdpUrl

        # @!attribute launch_options
        #
        #   @return [Stagehand::Models::SessionStartParams::Browser::LaunchOptions, nil]
        optional :launch_options,
                 -> { Stagehand::SessionStartParams::Browser::LaunchOptions },
                 api_name: :launchOptions

        # @!attribute type
        #   Browser type to use
        #
        #   @return [Symbol, Stagehand::Models::SessionStartParams::Browser::Type, nil]
        optional :type, enum: -> { Stagehand::SessionStartParams::Browser::Type }

        # @!method initialize(cdp_url: nil, launch_options: nil, type: nil)
        #   @param cdp_url [String] Chrome DevTools Protocol URL for connecting to existing browser
        #
        #   @param launch_options [Stagehand::Models::SessionStartParams::Browser::LaunchOptions]
        #
        #   @param type [Symbol, Stagehand::Models::SessionStartParams::Browser::Type] Browser type to use

        # @see Stagehand::Models::SessionStartParams::Browser#launch_options
        class LaunchOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute accept_downloads
          #
          #   @return [Boolean, nil]
          optional :accept_downloads, Stagehand::Internal::Type::Boolean, api_name: :acceptDownloads

          # @!attribute args
          #
          #   @return [Array<String>, nil]
          optional :args, Stagehand::Internal::Type::ArrayOf[String]

          # @!attribute cdp_headers
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :cdp_headers, Stagehand::Internal::Type::HashOf[String], api_name: :cdpHeaders

          # @!attribute cdp_url
          #
          #   @return [String, nil]
          optional :cdp_url, String, api_name: :cdpUrl

          # @!attribute chromium_sandbox
          #
          #   @return [Boolean, nil]
          optional :chromium_sandbox, Stagehand::Internal::Type::Boolean, api_name: :chromiumSandbox

          # @!attribute connect_timeout_ms
          #
          #   @return [Float, nil]
          optional :connect_timeout_ms, Float, api_name: :connectTimeoutMs

          # @!attribute device_scale_factor
          #
          #   @return [Float, nil]
          optional :device_scale_factor, Float, api_name: :deviceScaleFactor

          # @!attribute devtools
          #
          #   @return [Boolean, nil]
          optional :devtools, Stagehand::Internal::Type::Boolean

          # @!attribute downloads_path
          #
          #   @return [String, nil]
          optional :downloads_path, String, api_name: :downloadsPath

          # @!attribute executable_path
          #
          #   @return [String, nil]
          optional :executable_path, String, api_name: :executablePath

          # @!attribute has_touch
          #
          #   @return [Boolean, nil]
          optional :has_touch, Stagehand::Internal::Type::Boolean, api_name: :hasTouch

          # @!attribute headless
          #
          #   @return [Boolean, nil]
          optional :headless, Stagehand::Internal::Type::Boolean

          # @!attribute ignore_default_args
          #
          #   @return [Boolean, Array<String>, nil]
          optional :ignore_default_args,
                   union: -> { Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs },
                   api_name: :ignoreDefaultArgs

          # @!attribute ignore_https_errors
          #
          #   @return [Boolean, nil]
          optional :ignore_https_errors, Stagehand::Internal::Type::Boolean, api_name: :ignoreHTTPSErrors

          # @!attribute locale
          #
          #   @return [String, nil]
          optional :locale, String

          # @!attribute port
          #
          #   @return [Float, nil]
          optional :port, Float

          # @!attribute preserve_user_data_dir
          #
          #   @return [Boolean, nil]
          optional :preserve_user_data_dir, Stagehand::Internal::Type::Boolean, api_name: :preserveUserDataDir

          # @!attribute proxy
          #
          #   @return [Stagehand::Models::SessionStartParams::Browser::LaunchOptions::Proxy, nil]
          optional :proxy, -> { Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy }

          # @!attribute user_data_dir
          #
          #   @return [String, nil]
          optional :user_data_dir, String, api_name: :userDataDir

          # @!attribute viewport
          #
          #   @return [Stagehand::Models::SessionStartParams::Browser::LaunchOptions::Viewport, nil]
          optional :viewport, -> { Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport }

          # @!method initialize(accept_downloads: nil, args: nil, cdp_headers: nil, cdp_url: nil, chromium_sandbox: nil, connect_timeout_ms: nil, device_scale_factor: nil, devtools: nil, downloads_path: nil, executable_path: nil, has_touch: nil, headless: nil, ignore_default_args: nil, ignore_https_errors: nil, locale: nil, port: nil, preserve_user_data_dir: nil, proxy: nil, user_data_dir: nil, viewport: nil)
          #   @param accept_downloads [Boolean]
          #   @param args [Array<String>]
          #   @param cdp_headers [Hash{Symbol=>String}]
          #   @param cdp_url [String]
          #   @param chromium_sandbox [Boolean]
          #   @param connect_timeout_ms [Float]
          #   @param device_scale_factor [Float]
          #   @param devtools [Boolean]
          #   @param downloads_path [String]
          #   @param executable_path [String]
          #   @param has_touch [Boolean]
          #   @param headless [Boolean]
          #   @param ignore_default_args [Boolean, Array<String>]
          #   @param ignore_https_errors [Boolean]
          #   @param locale [String]
          #   @param port [Float]
          #   @param preserve_user_data_dir [Boolean]
          #   @param proxy [Stagehand::Models::SessionStartParams::Browser::LaunchOptions::Proxy]
          #   @param user_data_dir [String]
          #   @param viewport [Stagehand::Models::SessionStartParams::Browser::LaunchOptions::Viewport]

          # @see Stagehand::Models::SessionStartParams::Browser::LaunchOptions#ignore_default_args
          module IgnoreDefaultArgs
            extend Stagehand::Internal::Type::Union

            variant Stagehand::Internal::Type::Boolean

            variant -> { Stagehand::Models::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::StringArray }

            # @!method self.variants
            #   @return [Array(Boolean, Array<String>)]

            # @type [Stagehand::Internal::Type::Converter]
            StringArray = Stagehand::Internal::Type::ArrayOf[String]
          end

          # @see Stagehand::Models::SessionStartParams::Browser::LaunchOptions#proxy
          class Proxy < Stagehand::Internal::Type::BaseModel
            # @!attribute server
            #
            #   @return [String]
            required :server, String

            # @!attribute bypass
            #
            #   @return [String, nil]
            optional :bypass, String

            # @!attribute password
            #
            #   @return [String, nil]
            optional :password, String

            # @!attribute username
            #
            #   @return [String, nil]
            optional :username, String

            # @!method initialize(server:, bypass: nil, password: nil, username: nil)
            #   @param server [String]
            #   @param bypass [String]
            #   @param password [String]
            #   @param username [String]
          end

          # @see Stagehand::Models::SessionStartParams::Browser::LaunchOptions#viewport
          class Viewport < Stagehand::Internal::Type::BaseModel
            # @!attribute height
            #
            #   @return [Float]
            required :height, Float

            # @!attribute width
            #
            #   @return [Float]
            required :width, Float

            # @!method initialize(height:, width:)
            #   @param height [Float]
            #   @param width [Float]
          end
        end

        # Browser type to use
        #
        # @see Stagehand::Models::SessionStartParams::Browser#type
        module Type
          extend Stagehand::Internal::Type::Enum

          LOCAL = :local
          BROWSERBASE = :browserbase

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class BrowserbaseSessionCreateParams < Stagehand::Internal::Type::BaseModel
        # @!attribute browser_settings
        #
        #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings, nil]
        optional :browser_settings,
                 -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings },
                 api_name: :browserSettings

        # @!attribute extension_id
        #
        #   @return [String, nil]
        optional :extension_id, String, api_name: :extensionId

        # @!attribute keep_alive
        #
        #   @return [Boolean, nil]
        optional :keep_alive, Stagehand::Internal::Type::Boolean, api_name: :keepAlive

        # @!attribute project_id
        #
        #   @return [String, nil]
        optional :project_id, String, api_name: :projectId

        # @!attribute proxies
        #
        #   @return [Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::External>, nil]
        optional :proxies, union: -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies }

        # @!attribute region
        #
        #   @return [Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Region, nil]
        optional :region, enum: -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region }

        # @!attribute timeout
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute user_metadata
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :user_metadata,
                 Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown],
                 api_name: :userMetadata

        # @!method initialize(browser_settings: nil, extension_id: nil, keep_alive: nil, project_id: nil, proxies: nil, region: nil, timeout: nil, user_metadata: nil)
        #   @param browser_settings [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings]
        #   @param extension_id [String]
        #   @param keep_alive [Boolean]
        #   @param project_id [String]
        #   @param proxies [Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::External>]
        #   @param region [Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Region]
        #   @param timeout [Float]
        #   @param user_metadata [Hash{Symbol=>Object}]

        # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams#browser_settings
        class BrowserSettings < Stagehand::Internal::Type::BaseModel
          # @!attribute advanced_stealth
          #
          #   @return [Boolean, nil]
          optional :advanced_stealth, Stagehand::Internal::Type::Boolean, api_name: :advancedStealth

          # @!attribute block_ads
          #
          #   @return [Boolean, nil]
          optional :block_ads, Stagehand::Internal::Type::Boolean, api_name: :blockAds

          # @!attribute context
          #
          #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context, nil]
          optional :context,
                   -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context }

          # @!attribute extension_id
          #
          #   @return [String, nil]
          optional :extension_id, String, api_name: :extensionId

          # @!attribute fingerprint
          #
          #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint, nil]
          optional :fingerprint,
                   -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint }

          # @!attribute log_session
          #
          #   @return [Boolean, nil]
          optional :log_session, Stagehand::Internal::Type::Boolean, api_name: :logSession

          # @!attribute record_session
          #
          #   @return [Boolean, nil]
          optional :record_session, Stagehand::Internal::Type::Boolean, api_name: :recordSession

          # @!attribute solve_captchas
          #
          #   @return [Boolean, nil]
          optional :solve_captchas, Stagehand::Internal::Type::Boolean, api_name: :solveCaptchas

          # @!attribute viewport
          #
          #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport, nil]
          optional :viewport,
                   -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport }

          # @!method initialize(advanced_stealth: nil, block_ads: nil, context: nil, extension_id: nil, fingerprint: nil, log_session: nil, record_session: nil, solve_captchas: nil, viewport: nil)
          #   @param advanced_stealth [Boolean]
          #   @param block_ads [Boolean]
          #   @param context [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context]
          #   @param extension_id [String]
          #   @param fingerprint [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint]
          #   @param log_session [Boolean]
          #   @param record_session [Boolean]
          #   @param solve_captchas [Boolean]
          #   @param viewport [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport]

          # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings#context
          class Context < Stagehand::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute persist
            #
            #   @return [Boolean, nil]
            optional :persist, Stagehand::Internal::Type::Boolean

            # @!method initialize(id:, persist: nil)
            #   @param id [String]
            #   @param persist [Boolean]
          end

          # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings#fingerprint
          class Fingerprint < Stagehand::Internal::Type::BaseModel
            # @!attribute browsers
            #
            #   @return [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser>, nil]
            optional :browsers,
                     -> { Stagehand::Internal::Type::ArrayOf[enum: Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser] }

            # @!attribute devices
            #
            #   @return [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device>, nil]
            optional :devices,
                     -> { Stagehand::Internal::Type::ArrayOf[enum: Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device] }

            # @!attribute http_version
            #
            #   @return [Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion, nil]
            optional :http_version,
                     enum: -> {
                       Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion
                     },
                     api_name: :httpVersion

            # @!attribute locales
            #
            #   @return [Array<String>, nil]
            optional :locales, Stagehand::Internal::Type::ArrayOf[String]

            # @!attribute operating_systems
            #
            #   @return [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem>, nil]
            optional :operating_systems,
                     -> do
                       Stagehand::Internal::Type::ArrayOf[
                         enum: Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem
                       ]
                     end,
                     api_name: :operatingSystems

            # @!attribute screen
            #
            #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen, nil]
            optional :screen,
                     -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen }

            # @!method initialize(browsers: nil, devices: nil, http_version: nil, locales: nil, operating_systems: nil, screen: nil)
            #   @param browsers [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser>]
            #   @param devices [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device>]
            #   @param http_version [Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion]
            #   @param locales [Array<String>]
            #   @param operating_systems [Array<Symbol, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem>]
            #   @param screen [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen]

            module Browser
              extend Stagehand::Internal::Type::Enum

              CHROME = :chrome
              EDGE = :edge
              FIREFOX = :firefox
              SAFARI = :safari

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            module Device
              extend Stagehand::Internal::Type::Enum

              DESKTOP = :desktop
              MOBILE = :mobile

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint#http_version
            module HTTPVersion
              extend Stagehand::Internal::Type::Enum

              HTTP_VERSION_1 = :"1"
              HTTP_VERSION_2 = :"2"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            module OperatingSystem
              extend Stagehand::Internal::Type::Enum

              ANDROID = :android
              IOS = :ios
              LINUX = :linux
              MACOS = :macos
              WINDOWS = :windows

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint#screen
            class Screen < Stagehand::Internal::Type::BaseModel
              # @!attribute max_height
              #
              #   @return [Float, nil]
              optional :max_height, Float, api_name: :maxHeight

              # @!attribute max_width
              #
              #   @return [Float, nil]
              optional :max_width, Float, api_name: :maxWidth

              # @!attribute min_height
              #
              #   @return [Float, nil]
              optional :min_height, Float, api_name: :minHeight

              # @!attribute min_width
              #
              #   @return [Float, nil]
              optional :min_width, Float, api_name: :minWidth

              # @!method initialize(max_height: nil, max_width: nil, min_height: nil, min_width: nil)
              #   @param max_height [Float]
              #   @param max_width [Float]
              #   @param min_height [Float]
              #   @param min_width [Float]
            end
          end

          # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings#viewport
          class Viewport < Stagehand::Internal::Type::BaseModel
            # @!attribute height
            #
            #   @return [Float, nil]
            optional :height, Float

            # @!attribute width
            #
            #   @return [Float, nil]
            optional :width, Float

            # @!method initialize(height: nil, width: nil)
            #   @param height [Float]
            #   @param width [Float]
          end
        end

        # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams#proxies
        module Proxies
          extend Stagehand::Internal::Type::Union

          variant Stagehand::Internal::Type::Boolean

          variant -> { Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigListArray }

          module ProxyConfigList
            extend Stagehand::Internal::Type::Union

            discriminator :type

            variant :browserbase,
                    -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase }

            variant :external,
                    -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::External }

            class Browserbase < Stagehand::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :browserbase]
              required :type, const: :browserbase

              # @!attribute domain_pattern
              #
              #   @return [String, nil]
              optional :domain_pattern, String, api_name: :domainPattern

              # @!attribute geolocation
              #
              #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase::Geolocation, nil]
              optional :geolocation,
                       -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase::Geolocation }

              # @!method initialize(domain_pattern: nil, geolocation: nil, type: :browserbase)
              #   @param domain_pattern [String]
              #   @param geolocation [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase::Geolocation]
              #   @param type [Symbol, :browserbase]

              # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase#geolocation
              class Geolocation < Stagehand::Internal::Type::BaseModel
                # @!attribute country
                #
                #   @return [String]
                required :country, String

                # @!attribute city
                #
                #   @return [String, nil]
                optional :city, String

                # @!attribute state
                #
                #   @return [String, nil]
                optional :state, String

                # @!method initialize(country:, city: nil, state: nil)
                #   @param country [String]
                #   @param city [String]
                #   @param state [String]
              end
            end

            class External < Stagehand::Internal::Type::BaseModel
              # @!attribute server
              #
              #   @return [String]
              required :server, String

              # @!attribute type
              #
              #   @return [Symbol, :external]
              required :type, const: :external

              # @!attribute domain_pattern
              #
              #   @return [String, nil]
              optional :domain_pattern, String, api_name: :domainPattern

              # @!attribute password
              #
              #   @return [String, nil]
              optional :password, String

              # @!attribute username
              #
              #   @return [String, nil]
              optional :username, String

              # @!method initialize(server:, domain_pattern: nil, password: nil, username: nil, type: :external)
              #   @param server [String]
              #   @param domain_pattern [String]
              #   @param password [String]
              #   @param username [String]
              #   @param type [Symbol, :external]
            end

            # @!method self.variants
            #   @return [Array(Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::External)]
          end

          # @!method self.variants
          #   @return [Array(Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList::External>)]

          # @type [Stagehand::Internal::Type::Converter]
          ProxyConfigListArray =
            Stagehand::Internal::Type::ArrayOf[union: -> {
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::ProxyConfigList
            }]
        end

        # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams#region
        module Region
          extend Stagehand::Internal::Type::Enum

          US_WEST_2 = :"us-west-2"
          US_EAST_1 = :"us-east-1"
          EU_CENTRAL_1 = :"eu-central-1"
          AP_SOUTHEAST_1 = :"ap-southeast-1"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Optional provider-specific configuration for the session model (for example
      # Bedrock region and credentials)
      module ModelClientOptions
        extend Stagehand::Internal::Type::Union

        variant -> { Stagehand::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions }

        variant -> { Stagehand::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions }

        variant -> { Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions }

        class BedrockAPIKeyModelClientOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute api_key
          #   Short-term Bedrock API key for bearer-token auth
          #
          #   @return [String]
          required :api_key, String, api_name: :apiKey

          # @!attribute provider_options
          #
          #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions::ProviderOptions]
          required :provider_options,
                   -> {
                     Stagehand::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions::ProviderOptions
                   },
                   api_name: :providerOptions

          # @!attribute base_url
          #   Base URL for the model provider
          #
          #   @return [String, nil]
          optional :base_url, String, api_name: :baseURL

          # @!attribute headers
          #   Custom headers for the model provider
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Stagehand::Internal::Type::HashOf[String]

          # @!attribute skip_api_key_fallback
          #   When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
          #   this when auth is carried through providerOptions instead of an API key.
          #
          #   @return [Boolean, nil]
          optional :skip_api_key_fallback, Stagehand::Internal::Type::Boolean, api_name: :skipApiKeyFallback

          # @!method initialize(api_key:, provider_options:, base_url: nil, headers: nil, skip_api_key_fallback: nil)
          #   Some parameter documentations has been truncated, see
          #   {Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions}
          #   for more details.
          #
          #   @param api_key [String] Short-term Bedrock API key for bearer-token auth
          #
          #   @param provider_options [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions::ProviderOptions]
          #
          #   @param base_url [String] Base URL for the model provider
          #
          #   @param headers [Hash{Symbol=>String}] Custom headers for the model provider
          #
          #   @param skip_api_key_fallback [Boolean] When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use

          # @see Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions#provider_options
          class ProviderOptions < Stagehand::Internal::Type::BaseModel
            # @!attribute region
            #   AWS region for Amazon Bedrock
            #
            #   @return [String]
            required :region, String

            # @!method initialize(region:)
            #   @param region [String] AWS region for Amazon Bedrock
          end
        end

        class BedrockAwsCredentialsModelClientOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute provider_options
          #
          #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions::ProviderOptions]
          required :provider_options,
                   -> {
                     Stagehand::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions::ProviderOptions
                   },
                   api_name: :providerOptions

          # @!attribute base_url
          #   Base URL for the model provider
          #
          #   @return [String, nil]
          optional :base_url, String, api_name: :baseURL

          # @!attribute headers
          #   Custom headers for the model provider
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Stagehand::Internal::Type::HashOf[String]

          # @!attribute skip_api_key_fallback
          #   When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
          #   this when auth is carried through providerOptions instead of an API key.
          #
          #   @return [Boolean, nil]
          optional :skip_api_key_fallback, Stagehand::Internal::Type::Boolean, api_name: :skipApiKeyFallback

          # @!method initialize(provider_options:, base_url: nil, headers: nil, skip_api_key_fallback: nil)
          #   Some parameter documentations has been truncated, see
          #   {Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions}
          #   for more details.
          #
          #   @param provider_options [Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions::ProviderOptions]
          #
          #   @param base_url [String] Base URL for the model provider
          #
          #   @param headers [Hash{Symbol=>String}] Custom headers for the model provider
          #
          #   @param skip_api_key_fallback [Boolean] When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use

          # @see Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions#provider_options
          class ProviderOptions < Stagehand::Internal::Type::BaseModel
            # @!attribute access_key_id
            #   AWS access key ID for Bedrock
            #
            #   @return [String]
            required :access_key_id, String, api_name: :accessKeyId

            # @!attribute region
            #   AWS region for Amazon Bedrock
            #
            #   @return [String]
            required :region, String

            # @!attribute secret_access_key
            #   AWS secret access key for Bedrock
            #
            #   @return [String]
            required :secret_access_key, String, api_name: :secretAccessKey

            # @!attribute session_token
            #   Optional AWS session token for temporary credentials
            #
            #   @return [String, nil]
            optional :session_token, String, api_name: :sessionToken

            # @!method initialize(access_key_id:, region:, secret_access_key:, session_token: nil)
            #   @param access_key_id [String] AWS access key ID for Bedrock
            #
            #   @param region [String] AWS region for Amazon Bedrock
            #
            #   @param secret_access_key [String] AWS secret access key for Bedrock
            #
            #   @param session_token [String] Optional AWS session token for temporary credentials
          end
        end

        class GenericModelClientOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute api_key
          #   API key for the model provider
          #
          #   @return [String, nil]
          optional :api_key, String, api_name: :apiKey

          # @!attribute base_url
          #   Base URL for the model provider
          #
          #   @return [String, nil]
          optional :base_url, String, api_name: :baseURL

          # @!attribute headers
          #   Custom headers for the model provider
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Stagehand::Internal::Type::HashOf[String]

          # @!attribute provider_options
          #   Provider-specific options passed through to the AI SDK provider constructor. For
          #   Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
          #   project, location, googleAuthOptions }.
          #
          #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions, nil]
          optional :provider_options,
                   union: -> {
                     Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions
                   },
                   api_name: :providerOptions

          # @!attribute skip_api_key_fallback
          #   When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
          #   this when auth is carried through providerOptions instead of an API key.
          #
          #   @return [Boolean, nil]
          optional :skip_api_key_fallback, Stagehand::Internal::Type::Boolean, api_name: :skipApiKeyFallback

          # @!method initialize(api_key: nil, base_url: nil, headers: nil, provider_options: nil, skip_api_key_fallback: nil)
          #   Some parameter documentations has been truncated, see
          #   {Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions}
          #   for more details.
          #
          #   @param api_key [String] API key for the model provider
          #
          #   @param base_url [String] Base URL for the model provider
          #
          #   @param headers [Hash{Symbol=>String}] Custom headers for the model provider
          #
          #   @param provider_options [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions] Provider-specific options passed through to the AI SDK provider constructor. For
          #
          #   @param skip_api_key_fallback [Boolean] When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use

          # Provider-specific options passed through to the AI SDK provider constructor. For
          # Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
          # project, location, googleAuthOptions }.
          #
          # @see Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions#provider_options
          module ProviderOptions
            extend Stagehand::Internal::Type::Union

            variant -> { Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAPIKeyProviderOptions }

            variant -> { Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAwsCredentialsProviderOptions }

            variant -> { Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions }

            class BedrockAPIKeyProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute region
              #   AWS region for Amazon Bedrock
              #
              #   @return [String]
              required :region, String

              # @!method initialize(region:)
              #   @param region [String] AWS region for Amazon Bedrock
            end

            class BedrockAwsCredentialsProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute access_key_id
              #   AWS access key ID for Bedrock
              #
              #   @return [String]
              required :access_key_id, String, api_name: :accessKeyId

              # @!attribute region
              #   AWS region for Amazon Bedrock
              #
              #   @return [String]
              required :region, String

              # @!attribute secret_access_key
              #   AWS secret access key for Bedrock
              #
              #   @return [String]
              required :secret_access_key, String, api_name: :secretAccessKey

              # @!attribute session_token
              #   Optional AWS session token for temporary credentials
              #
              #   @return [String, nil]
              optional :session_token, String, api_name: :sessionToken

              # @!method initialize(access_key_id:, region:, secret_access_key:, session_token: nil)
              #   @param access_key_id [String] AWS access key ID for Bedrock
              #
              #   @param region [String] AWS region for Amazon Bedrock
              #
              #   @param secret_access_key [String] AWS secret access key for Bedrock
              #
              #   @param session_token [String] Optional AWS session token for temporary credentials
            end

            class GoogleVertexProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute google_auth_options
              #   Optional Google auth options for Vertex AI
              #
              #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions, nil]
              optional :google_auth_options,
                       -> {
                         Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions
                       },
                       api_name: :googleAuthOptions

              # @!attribute headers
              #   Custom headers for Vertex AI requests
              #
              #   @return [Hash{Symbol=>String}, nil]
              optional :headers, Stagehand::Internal::Type::HashOf[String]

              # @!attribute location
              #   Google Cloud location for Vertex AI
              #
              #   @return [String, nil]
              optional :location, String

              # @!attribute project
              #   Google Cloud project ID for Vertex AI
              #
              #   @return [String, nil]
              optional :project, String

              # @!method initialize(google_auth_options: nil, headers: nil, location: nil, project: nil)
              #   @param google_auth_options [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions] Optional Google auth options for Vertex AI
              #
              #   @param headers [Hash{Symbol=>String}] Custom headers for Vertex AI requests
              #
              #   @param location [String] Google Cloud location for Vertex AI
              #
              #   @param project [String] Google Cloud project ID for Vertex AI

              # @see Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions#google_auth_options
              class GoogleAuthOptions < Stagehand::Internal::Type::BaseModel
                # @!attribute credentials
                #
                #   @return [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials, nil]
                optional :credentials,
                         -> { Stagehand::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials }

                # @!method initialize(credentials: nil)
                #   Optional Google auth options for Vertex AI
                #
                #   @param credentials [Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials]

                # @see Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions#credentials
                class Credentials < Stagehand::Internal::Type::BaseModel
                  # @!attribute auth_provider_x509_cert_url
                  #
                  #   @return [String, nil]
                  optional :auth_provider_x509_cert_url, String

                  # @!attribute auth_uri
                  #
                  #   @return [String, nil]
                  optional :auth_uri, String

                  # @!attribute client_email
                  #
                  #   @return [String, nil]
                  optional :client_email, String

                  # @!attribute client_id
                  #
                  #   @return [String, nil]
                  optional :client_id, String

                  # @!attribute client_x509_cert_url
                  #
                  #   @return [String, nil]
                  optional :client_x509_cert_url, String

                  # @!attribute private_key
                  #
                  #   @return [String, nil]
                  optional :private_key, String

                  # @!attribute private_key_id
                  #
                  #   @return [String, nil]
                  optional :private_key_id, String

                  # @!attribute project_id
                  #
                  #   @return [String, nil]
                  optional :project_id, String

                  # @!attribute token_uri
                  #
                  #   @return [String, nil]
                  optional :token_uri, String

                  # @!attribute type
                  #
                  #   @return [String, nil]
                  optional :type, String

                  # @!attribute universe_domain
                  #
                  #   @return [String, nil]
                  optional :universe_domain, String

                  # @!method initialize(auth_provider_x509_cert_url: nil, auth_uri: nil, client_email: nil, client_id: nil, client_x509_cert_url: nil, private_key: nil, private_key_id: nil, project_id: nil, token_uri: nil, type: nil, universe_domain: nil)
                  #   @param auth_provider_x509_cert_url [String]
                  #   @param auth_uri [String]
                  #   @param client_email [String]
                  #   @param client_id [String]
                  #   @param client_x509_cert_url [String]
                  #   @param private_key [String]
                  #   @param private_key_id [String]
                  #   @param project_id [String]
                  #   @param token_uri [String]
                  #   @param type [String]
                  #   @param universe_domain [String]
                end
              end
            end

            # @!method self.variants
            #   @return [Array(Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions::ProviderOptions::GoogleVertexProviderOptions)]
          end
        end

        # @!method self.variants
        #   @return [Array(Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAPIKeyModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::BedrockAwsCredentialsModelClientOptions, Stagehand::Models::SessionStartParams::ModelClientOptions::GenericModelClientOptions)]
      end

      # Logging verbosity level (0=quiet, 1=normal, 2=debug)
      module Verbose
        extend Stagehand::Internal::Type::Enum

        VERBOSE_0 = 0
        VERBOSE_1 = 1
        VERBOSE_2 = 2

        # @!method self.values
        #   @return [Array<Float>]
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
