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
      #   Timeout in ms for act operations
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

      # @!attribute debug_dom
      #
      #   @return [Boolean, nil]
      optional :debug_dom, Stagehand::Internal::Type::Boolean, api_name: :debugDom

      # @!attribute dom_settle_timeout_ms
      #   Timeout in ms to wait for DOM to settle
      #
      #   @return [Float, nil]
      optional :dom_settle_timeout_ms, Float, api_name: :domSettleTimeoutMs

      # @!attribute experimental
      #
      #   @return [Boolean, nil]
      optional :experimental, Stagehand::Internal::Type::Boolean

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
      #   @return [Integer, Stagehand::Models::SessionStartParams::Verbose, nil]
      optional :verbose, enum: -> { Stagehand::SessionStartParams::Verbose }

      # @!attribute wait_for_captcha_solves
      #
      #   @return [Boolean, nil]
      optional :wait_for_captcha_solves, Stagehand::Internal::Type::Boolean, api_name: :waitForCaptchaSolves

      # @!attribute x_language
      #   Client SDK language
      #
      #   @return [Symbol, Stagehand::Models::SessionStartParams::XLanguage, nil]
      optional :x_language, enum: -> { Stagehand::SessionStartParams::XLanguage }

      # @!attribute x_sdk_version
      #   Version of the Stagehand SDK
      #
      #   @return [String, nil]
      optional :x_sdk_version, String

      # @!attribute x_sent_at
      #   ISO timestamp when request was sent
      #
      #   @return [Time, nil]
      optional :x_sent_at, Time

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionStartParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionStartParams::XStreamResponse }

      # @!method initialize(model_name:, act_timeout_ms: nil, browser: nil, browserbase_session_create_params: nil, browserbase_session_id: nil, debug_dom: nil, dom_settle_timeout_ms: nil, experimental: nil, self_heal: nil, system_prompt: nil, verbose: nil, wait_for_captcha_solves: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param model_name [String] Model name to use for AI operations
      #
      #   @param act_timeout_ms [Float] Timeout in ms for act operations
      #
      #   @param browser [Stagehand::Models::SessionStartParams::Browser]
      #
      #   @param browserbase_session_create_params [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams]
      #
      #   @param browserbase_session_id [String] Existing Browserbase session ID to resume
      #
      #   @param debug_dom [Boolean]
      #
      #   @param dom_settle_timeout_ms [Float] Timeout in ms to wait for DOM to settle
      #
      #   @param experimental [Boolean]
      #
      #   @param self_heal [Boolean] Enable self-healing for failed actions
      #
      #   @param system_prompt [String] Custom system prompt for AI operations
      #
      #   @param verbose [Integer, Stagehand::Models::SessionStartParams::Verbose] Logging verbosity level (0=quiet, 1=normal, 2=debug)
      #
      #   @param wait_for_captcha_solves [Boolean]
      #
      #   @param x_language [Symbol, Stagehand::Models::SessionStartParams::XLanguage] Client SDK language
      #
      #   @param x_sdk_version [String] Version of the Stagehand SDK
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
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

          # @!method initialize(accept_downloads: nil, args: nil, cdp_url: nil, chromium_sandbox: nil, connect_timeout_ms: nil, device_scale_factor: nil, devtools: nil, downloads_path: nil, executable_path: nil, has_touch: nil, headless: nil, ignore_default_args: nil, ignore_https_errors: nil, locale: nil, preserve_user_data_dir: nil, proxy: nil, user_data_dir: nil, viewport: nil)
          #   @param accept_downloads [Boolean]
          #   @param args [Array<String>]
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
        #   @return [Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::External>, nil]
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
        #   @param proxies [Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::External>]
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

          variant -> { Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1Array }

          module UnionMember1
            extend Stagehand::Internal::Type::Union

            discriminator :type

            variant :browserbase,
                    -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase }

            variant :external,
                    -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::External }

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
              #   @return [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase::Geolocation, nil]
              optional :geolocation,
                       -> { Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase::Geolocation }

              # @!method initialize(domain_pattern: nil, geolocation: nil, type: :browserbase)
              #   @param domain_pattern [String]
              #   @param geolocation [Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase::Geolocation]
              #   @param type [Symbol, :browserbase]

              # @see Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase#geolocation
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
            #   @return [Array(Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::External)]
          end

          # @!method self.variants
          #   @return [Array(Boolean, Array<Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Browserbase, Stagehand::Models::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::External>)]

          # @type [Stagehand::Internal::Type::Converter]
          UnionMember1Array =
            Stagehand::Internal::Type::ArrayOf[union: -> {
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1
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

      # Logging verbosity level (0=quiet, 1=normal, 2=debug)
      module Verbose
        extend Stagehand::Internal::Type::Enum

        VERBOSE_0 = 0
        VERBOSE_1 = 1
        VERBOSE_2 = 2

        # @!method self.values
        #   @return [Array<Integer>]
      end

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TYPESCRIPT = :typescript
        PYTHON = :python
        PLAYGROUND = :playground

        # @!method self.values
        #   @return [Array<Symbol>]
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
