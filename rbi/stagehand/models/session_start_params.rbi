# typed: strong

module Stagehand
  module Models
    class SessionStartParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionStartParams, Stagehand::Internal::AnyHash)
        end

      # Model name to use for AI operations
      sig { returns(String) }
      attr_accessor :model_name

      # Timeout in ms for act operations
      sig { returns(T.nilable(Float)) }
      attr_reader :act_timeout_ms

      sig { params(act_timeout_ms: Float).void }
      attr_writer :act_timeout_ms

      sig { returns(T.nilable(Stagehand::SessionStartParams::Browser)) }
      attr_reader :browser

      sig do
        params(browser: Stagehand::SessionStartParams::Browser::OrHash).void
      end
      attr_writer :browser

      sig do
        returns(
          T.nilable(
            Stagehand::SessionStartParams::BrowserbaseSessionCreateParams
          )
        )
      end
      attr_reader :browserbase_session_create_params

      sig do
        params(
          browserbase_session_create_params:
            Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::OrHash
        ).void
      end
      attr_writer :browserbase_session_create_params

      # Existing Browserbase session ID to resume
      sig { returns(T.nilable(String)) }
      attr_reader :browserbase_session_id

      sig { params(browserbase_session_id: String).void }
      attr_writer :browserbase_session_id

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :debug_dom

      sig { params(debug_dom: T::Boolean).void }
      attr_writer :debug_dom

      # Timeout in ms to wait for DOM to settle
      sig { returns(T.nilable(Float)) }
      attr_reader :dom_settle_timeout_ms

      sig { params(dom_settle_timeout_ms: Float).void }
      attr_writer :dom_settle_timeout_ms

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :experimental

      sig { params(experimental: T::Boolean).void }
      attr_writer :experimental

      # Enable self-healing for failed actions
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :self_heal

      sig { params(self_heal: T::Boolean).void }
      attr_writer :self_heal

      # Custom system prompt for AI operations
      sig { returns(T.nilable(String)) }
      attr_reader :system_prompt

      sig { params(system_prompt: String).void }
      attr_writer :system_prompt

      # Logging verbosity level (0=quiet, 1=normal, 2=debug)
      sig do
        returns(T.nilable(Stagehand::SessionStartParams::Verbose::OrFloat))
      end
      attr_reader :verbose

      sig do
        params(verbose: Stagehand::SessionStartParams::Verbose::OrFloat).void
      end
      attr_writer :verbose

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :wait_for_captcha_solves

      sig { params(wait_for_captcha_solves: T::Boolean).void }
      attr_writer :wait_for_captcha_solves

      # Client SDK language
      sig do
        returns(T.nilable(Stagehand::SessionStartParams::XLanguage::OrSymbol))
      end
      attr_reader :x_language

      sig do
        params(
          x_language: Stagehand::SessionStartParams::XLanguage::OrSymbol
        ).void
      end
      attr_writer :x_language

      # Version of the Stagehand SDK
      sig { returns(T.nilable(String)) }
      attr_reader :x_sdk_version

      sig { params(x_sdk_version: String).void }
      attr_writer :x_sdk_version

      # ISO timestamp when request was sent
      sig { returns(T.nilable(Time)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: Time).void }
      attr_writer :x_sent_at

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(Stagehand::SessionStartParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionStartParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          model_name: String,
          act_timeout_ms: Float,
          browser: Stagehand::SessionStartParams::Browser::OrHash,
          browserbase_session_create_params:
            Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::OrHash,
          browserbase_session_id: String,
          debug_dom: T::Boolean,
          dom_settle_timeout_ms: Float,
          experimental: T::Boolean,
          self_heal: T::Boolean,
          system_prompt: String,
          verbose: Stagehand::SessionStartParams::Verbose::OrFloat,
          wait_for_captcha_solves: T::Boolean,
          x_language: Stagehand::SessionStartParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionStartParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Model name to use for AI operations
        model_name:,
        # Timeout in ms for act operations
        act_timeout_ms: nil,
        browser: nil,
        browserbase_session_create_params: nil,
        # Existing Browserbase session ID to resume
        browserbase_session_id: nil,
        debug_dom: nil,
        # Timeout in ms to wait for DOM to settle
        dom_settle_timeout_ms: nil,
        experimental: nil,
        # Enable self-healing for failed actions
        self_heal: nil,
        # Custom system prompt for AI operations
        system_prompt: nil,
        # Logging verbosity level (0=quiet, 1=normal, 2=debug)
        verbose: nil,
        wait_for_captcha_solves: nil,
        # Client SDK language
        x_language: nil,
        # Version of the Stagehand SDK
        x_sdk_version: nil,
        # ISO timestamp when request was sent
        x_sent_at: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            model_name: String,
            act_timeout_ms: Float,
            browser: Stagehand::SessionStartParams::Browser,
            browserbase_session_create_params:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams,
            browserbase_session_id: String,
            debug_dom: T::Boolean,
            dom_settle_timeout_ms: Float,
            experimental: T::Boolean,
            self_heal: T::Boolean,
            system_prompt: String,
            verbose: Stagehand::SessionStartParams::Verbose::OrFloat,
            wait_for_captcha_solves: T::Boolean,
            x_language: Stagehand::SessionStartParams::XLanguage::OrSymbol,
            x_sdk_version: String,
            x_sent_at: Time,
            x_stream_response:
              Stagehand::SessionStartParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Browser < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionStartParams::Browser,
              Stagehand::Internal::AnyHash
            )
          end

        # Chrome DevTools Protocol URL for connecting to existing browser
        sig { returns(T.nilable(String)) }
        attr_reader :cdp_url

        sig { params(cdp_url: String).void }
        attr_writer :cdp_url

        sig do
          returns(
            T.nilable(Stagehand::SessionStartParams::Browser::LaunchOptions)
          )
        end
        attr_reader :launch_options

        sig do
          params(
            launch_options:
              Stagehand::SessionStartParams::Browser::LaunchOptions::OrHash
          ).void
        end
        attr_writer :launch_options

        # Browser type to use
        sig do
          returns(
            T.nilable(Stagehand::SessionStartParams::Browser::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Stagehand::SessionStartParams::Browser::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            cdp_url: String,
            launch_options:
              Stagehand::SessionStartParams::Browser::LaunchOptions::OrHash,
            type: Stagehand::SessionStartParams::Browser::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Chrome DevTools Protocol URL for connecting to existing browser
          cdp_url: nil,
          launch_options: nil,
          # Browser type to use
          type: nil
        )
        end

        sig do
          override.returns(
            {
              cdp_url: String,
              launch_options:
                Stagehand::SessionStartParams::Browser::LaunchOptions,
              type: Stagehand::SessionStartParams::Browser::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        class LaunchOptions < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::SessionStartParams::Browser::LaunchOptions,
                Stagehand::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :accept_downloads

          sig { params(accept_downloads: T::Boolean).void }
          attr_writer :accept_downloads

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :args

          sig { params(args: T::Array[String]).void }
          attr_writer :args

          sig { returns(T.nilable(String)) }
          attr_reader :cdp_url

          sig { params(cdp_url: String).void }
          attr_writer :cdp_url

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :chromium_sandbox

          sig { params(chromium_sandbox: T::Boolean).void }
          attr_writer :chromium_sandbox

          sig { returns(T.nilable(Float)) }
          attr_reader :connect_timeout_ms

          sig { params(connect_timeout_ms: Float).void }
          attr_writer :connect_timeout_ms

          sig { returns(T.nilable(Float)) }
          attr_reader :device_scale_factor

          sig { params(device_scale_factor: Float).void }
          attr_writer :device_scale_factor

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :devtools

          sig { params(devtools: T::Boolean).void }
          attr_writer :devtools

          sig { returns(T.nilable(String)) }
          attr_reader :downloads_path

          sig { params(downloads_path: String).void }
          attr_writer :downloads_path

          sig { returns(T.nilable(String)) }
          attr_reader :executable_path

          sig { params(executable_path: String).void }
          attr_writer :executable_path

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_touch

          sig { params(has_touch: T::Boolean).void }
          attr_writer :has_touch

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :headless

          sig { params(headless: T::Boolean).void }
          attr_writer :headless

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::Variants
              )
            )
          end
          attr_reader :ignore_default_args

          sig do
            params(
              ignore_default_args:
                Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::Variants
            ).void
          end
          attr_writer :ignore_default_args

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :ignore_https_errors

          sig { params(ignore_https_errors: T::Boolean).void }
          attr_writer :ignore_https_errors

          sig { returns(T.nilable(String)) }
          attr_reader :locale

          sig { params(locale: String).void }
          attr_writer :locale

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :preserve_user_data_dir

          sig { params(preserve_user_data_dir: T::Boolean).void }
          attr_writer :preserve_user_data_dir

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy
              )
            )
          end
          attr_reader :proxy

          sig do
            params(
              proxy:
                Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy::OrHash
            ).void
          end
          attr_writer :proxy

          sig { returns(T.nilable(String)) }
          attr_reader :user_data_dir

          sig { params(user_data_dir: String).void }
          attr_writer :user_data_dir

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport
              )
            )
          end
          attr_reader :viewport

          sig do
            params(
              viewport:
                Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport::OrHash
            ).void
          end
          attr_writer :viewport

          sig do
            params(
              accept_downloads: T::Boolean,
              args: T::Array[String],
              cdp_url: String,
              chromium_sandbox: T::Boolean,
              connect_timeout_ms: Float,
              device_scale_factor: Float,
              devtools: T::Boolean,
              downloads_path: String,
              executable_path: String,
              has_touch: T::Boolean,
              headless: T::Boolean,
              ignore_default_args:
                Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::Variants,
              ignore_https_errors: T::Boolean,
              locale: String,
              preserve_user_data_dir: T::Boolean,
              proxy:
                Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy::OrHash,
              user_data_dir: String,
              viewport:
                Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            accept_downloads: nil,
            args: nil,
            cdp_url: nil,
            chromium_sandbox: nil,
            connect_timeout_ms: nil,
            device_scale_factor: nil,
            devtools: nil,
            downloads_path: nil,
            executable_path: nil,
            has_touch: nil,
            headless: nil,
            ignore_default_args: nil,
            ignore_https_errors: nil,
            locale: nil,
            preserve_user_data_dir: nil,
            proxy: nil,
            user_data_dir: nil,
            viewport: nil
          )
          end

          sig do
            override.returns(
              {
                accept_downloads: T::Boolean,
                args: T::Array[String],
                cdp_url: String,
                chromium_sandbox: T::Boolean,
                connect_timeout_ms: Float,
                device_scale_factor: Float,
                devtools: T::Boolean,
                downloads_path: String,
                executable_path: String,
                has_touch: T::Boolean,
                headless: T::Boolean,
                ignore_default_args:
                  Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::Variants,
                ignore_https_errors: T::Boolean,
                locale: String,
                preserve_user_data_dir: T::Boolean,
                proxy:
                  Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy,
                user_data_dir: String,
                viewport:
                  Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport
              }
            )
          end
          def to_hash
          end

          module IgnoreDefaultArgs
            extend Stagehand::Internal::Type::Union

            Variants = T.type_alias { T.any(T::Boolean, T::Array[String]) }

            sig do
              override.returns(
                T::Array[
                  Stagehand::SessionStartParams::Browser::LaunchOptions::IgnoreDefaultArgs::Variants
                ]
              )
            end
            def self.variants
            end

            StringArray =
              T.let(
                Stagehand::Internal::Type::ArrayOf[String],
                Stagehand::Internal::Type::Converter
              )
          end

          class Proxy < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::Browser::LaunchOptions::Proxy,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :server

            sig { returns(T.nilable(String)) }
            attr_reader :bypass

            sig { params(bypass: String).void }
            attr_writer :bypass

            sig { returns(T.nilable(String)) }
            attr_reader :password

            sig { params(password: String).void }
            attr_writer :password

            sig { returns(T.nilable(String)) }
            attr_reader :username

            sig { params(username: String).void }
            attr_writer :username

            sig do
              params(
                server: String,
                bypass: String,
                password: String,
                username: String
              ).returns(T.attached_class)
            end
            def self.new(server:, bypass: nil, password: nil, username: nil)
            end

            sig do
              override.returns(
                {
                  server: String,
                  bypass: String,
                  password: String,
                  username: String
                }
              )
            end
            def to_hash
            end
          end

          class Viewport < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::Browser::LaunchOptions::Viewport,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(Float) }
            attr_accessor :height

            sig { returns(Float) }
            attr_accessor :width

            sig do
              params(height: Float, width: Float).returns(T.attached_class)
            end
            def self.new(height:, width:)
            end

            sig { override.returns({ height: Float, width: Float }) }
            def to_hash
            end
          end
        end

        # Browser type to use
        module Type
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Stagehand::SessionStartParams::Browser::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOCAL =
            T.let(
              :local,
              Stagehand::SessionStartParams::Browser::Type::TaggedSymbol
            )
          BROWSERBASE =
            T.let(
              :browserbase,
              Stagehand::SessionStartParams::Browser::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionStartParams::Browser::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class BrowserbaseSessionCreateParams < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams,
              Stagehand::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings
            )
          )
        end
        attr_reader :browser_settings

        sig do
          params(
            browser_settings:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::OrHash
          ).void
        end
        attr_writer :browser_settings

        sig { returns(T.nilable(String)) }
        attr_reader :extension_id

        sig { params(extension_id: String).void }
        attr_writer :extension_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :keep_alive

        sig { params(keep_alive: T::Boolean).void }
        attr_writer :keep_alive

        sig { returns(T.nilable(String)) }
        attr_reader :project_id

        sig { params(project_id: String).void }
        attr_writer :project_id

        sig do
          returns(
            T.nilable(
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::Variants
            )
          )
        end
        attr_reader :proxies

        sig do
          params(
            proxies:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::Variants
          ).void
        end
        attr_writer :proxies

        sig do
          returns(
            T.nilable(
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::OrSymbol
            )
          )
        end
        attr_reader :region

        sig do
          params(
            region:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::OrSymbol
          ).void
        end
        attr_writer :region

        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :user_metadata

        sig { params(user_metadata: T::Hash[Symbol, T.anything]).void }
        attr_writer :user_metadata

        sig do
          params(
            browser_settings:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::OrHash,
            extension_id: String,
            keep_alive: T::Boolean,
            project_id: String,
            proxies:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::Variants,
            region:
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::OrSymbol,
            timeout: Float,
            user_metadata: T::Hash[Symbol, T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          browser_settings: nil,
          extension_id: nil,
          keep_alive: nil,
          project_id: nil,
          proxies: nil,
          region: nil,
          timeout: nil,
          user_metadata: nil
        )
        end

        sig do
          override.returns(
            {
              browser_settings:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings,
              extension_id: String,
              keep_alive: T::Boolean,
              project_id: String,
              proxies:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::Variants,
              region:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::OrSymbol,
              timeout: Float,
              user_metadata: T::Hash[Symbol, T.anything]
            }
          )
        end
        def to_hash
        end

        class BrowserSettings < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings,
                Stagehand::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :advanced_stealth

          sig { params(advanced_stealth: T::Boolean).void }
          attr_writer :advanced_stealth

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :block_ads

          sig { params(block_ads: T::Boolean).void }
          attr_writer :block_ads

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context
              )
            )
          end
          attr_reader :context

          sig do
            params(
              context:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context::OrHash
            ).void
          end
          attr_writer :context

          sig { returns(T.nilable(String)) }
          attr_reader :extension_id

          sig { params(extension_id: String).void }
          attr_writer :extension_id

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint
              )
            )
          end
          attr_reader :fingerprint

          sig do
            params(
              fingerprint:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OrHash
            ).void
          end
          attr_writer :fingerprint

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :log_session

          sig { params(log_session: T::Boolean).void }
          attr_writer :log_session

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :record_session

          sig { params(record_session: T::Boolean).void }
          attr_writer :record_session

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :solve_captchas

          sig { params(solve_captchas: T::Boolean).void }
          attr_writer :solve_captchas

          sig do
            returns(
              T.nilable(
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport
              )
            )
          end
          attr_reader :viewport

          sig do
            params(
              viewport:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport::OrHash
            ).void
          end
          attr_writer :viewport

          sig do
            params(
              advanced_stealth: T::Boolean,
              block_ads: T::Boolean,
              context:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context::OrHash,
              extension_id: String,
              fingerprint:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OrHash,
              log_session: T::Boolean,
              record_session: T::Boolean,
              solve_captchas: T::Boolean,
              viewport:
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            advanced_stealth: nil,
            block_ads: nil,
            context: nil,
            extension_id: nil,
            fingerprint: nil,
            log_session: nil,
            record_session: nil,
            solve_captchas: nil,
            viewport: nil
          )
          end

          sig do
            override.returns(
              {
                advanced_stealth: T::Boolean,
                block_ads: T::Boolean,
                context:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context,
                extension_id: String,
                fingerprint:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint,
                log_session: T::Boolean,
                record_session: T::Boolean,
                solve_captchas: T::Boolean,
                viewport:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport
              }
            )
          end
          def to_hash
          end

          class Context < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Context,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :persist

            sig { params(persist: T::Boolean).void }
            attr_writer :persist

            sig do
              params(id: String, persist: T::Boolean).returns(T.attached_class)
            end
            def self.new(id:, persist: nil)
            end

            sig { override.returns({ id: String, persist: T::Boolean }) }
            def to_hash
            end
          end

          class Fingerprint < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint,
                  Stagehand::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::OrSymbol
                  ]
                )
              )
            end
            attr_reader :browsers

            sig do
              params(
                browsers:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::OrSymbol
                  ]
              ).void
            end
            attr_writer :browsers

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::OrSymbol
                  ]
                )
              )
            end
            attr_reader :devices

            sig do
              params(
                devices:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::OrSymbol
                  ]
              ).void
            end
            attr_writer :devices

            sig do
              returns(
                T.nilable(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::OrSymbol
                )
              )
            end
            attr_reader :http_version

            sig do
              params(
                http_version:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::OrSymbol
              ).void
            end
            attr_writer :http_version

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :locales

            sig { params(locales: T::Array[String]).void }
            attr_writer :locales

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::OrSymbol
                  ]
                )
              )
            end
            attr_reader :operating_systems

            sig do
              params(
                operating_systems:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::OrSymbol
                  ]
              ).void
            end
            attr_writer :operating_systems

            sig do
              returns(
                T.nilable(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen
                )
              )
            end
            attr_reader :screen

            sig do
              params(
                screen:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen::OrHash
              ).void
            end
            attr_writer :screen

            sig do
              params(
                browsers:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::OrSymbol
                  ],
                devices:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::OrSymbol
                  ],
                http_version:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::OrSymbol,
                locales: T::Array[String],
                operating_systems:
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::OrSymbol
                  ],
                screen:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              browsers: nil,
              devices: nil,
              http_version: nil,
              locales: nil,
              operating_systems: nil,
              screen: nil
            )
            end

            sig do
              override.returns(
                {
                  browsers:
                    T::Array[
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::OrSymbol
                    ],
                  devices:
                    T::Array[
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::OrSymbol
                    ],
                  http_version:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::OrSymbol,
                  locales: T::Array[String],
                  operating_systems:
                    T::Array[
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::OrSymbol
                    ],
                  screen:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen
                }
              )
            end
            def to_hash
            end

            module Browser
              extend Stagehand::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CHROME =
                T.let(
                  :chrome,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::TaggedSymbol
                )
              EDGE =
                T.let(
                  :edge,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::TaggedSymbol
                )
              FIREFOX =
                T.let(
                  :firefox,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::TaggedSymbol
                )
              SAFARI =
                T.let(
                  :safari,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Browser::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Device
              extend Stagehand::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DESKTOP =
                T.let(
                  :desktop,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::TaggedSymbol
                )
              MOBILE =
                T.let(
                  :mobile,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Device::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module HTTPVersion
              extend Stagehand::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HTTP_VERSION_1 =
                T.let(
                  :"1",
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::TaggedSymbol
                )
              HTTP_VERSION_2 =
                T.let(
                  :"2",
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::HTTPVersion::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module OperatingSystem
              extend Stagehand::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ANDROID =
                T.let(
                  :android,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                )
              IOS =
                T.let(
                  :ios,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                )
              LINUX =
                T.let(
                  :linux,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                )
              MACOS =
                T.let(
                  :macos,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                )
              WINDOWS =
                T.let(
                  :windows,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::OperatingSystem::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Screen < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Fingerprint::Screen,
                    Stagehand::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(Float)) }
              attr_reader :max_height

              sig { params(max_height: Float).void }
              attr_writer :max_height

              sig { returns(T.nilable(Float)) }
              attr_reader :max_width

              sig { params(max_width: Float).void }
              attr_writer :max_width

              sig { returns(T.nilable(Float)) }
              attr_reader :min_height

              sig { params(min_height: Float).void }
              attr_writer :min_height

              sig { returns(T.nilable(Float)) }
              attr_reader :min_width

              sig { params(min_width: Float).void }
              attr_writer :min_width

              sig do
                params(
                  max_height: Float,
                  max_width: Float,
                  min_height: Float,
                  min_width: Float
                ).returns(T.attached_class)
              end
              def self.new(
                max_height: nil,
                max_width: nil,
                min_height: nil,
                min_width: nil
              )
              end

              sig do
                override.returns(
                  {
                    max_height: Float,
                    max_width: Float,
                    min_height: Float,
                    min_width: Float
                  }
                )
              end
              def to_hash
              end
            end
          end

          class Viewport < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::BrowserSettings::Viewport,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Float)) }
            attr_reader :height

            sig { params(height: Float).void }
            attr_writer :height

            sig { returns(T.nilable(Float)) }
            attr_reader :width

            sig { params(width: Float).void }
            attr_writer :width

            sig do
              params(height: Float, width: Float).returns(T.attached_class)
            end
            def self.new(height: nil, width: nil)
            end

            sig { override.returns({ height: Float, width: Float }) }
            def to_hash
            end
          end
        end

        module Proxies
          extend Stagehand::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                T::Array[
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Variants
                ]
              )
            end

          module UnionMember1
            extend Stagehand::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig,
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig
                )
              end

            class BrowserbaseProxyConfig < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig,
                    Stagehand::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig { returns(T.nilable(String)) }
              attr_reader :domain_pattern

              sig { params(domain_pattern: String).void }
              attr_writer :domain_pattern

              sig do
                returns(
                  T.nilable(
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Geolocation
                  )
                )
              end
              attr_reader :geolocation

              sig do
                params(
                  geolocation:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Geolocation::OrHash
                ).void
              end
              attr_writer :geolocation

              sig do
                params(
                  type:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type::OrSymbol,
                  domain_pattern: String,
                  geolocation:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Geolocation::OrHash
                ).returns(T.attached_class)
              end
              def self.new(type:, domain_pattern: nil, geolocation: nil)
              end

              sig do
                override.returns(
                  {
                    type:
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type::OrSymbol,
                    domain_pattern: String,
                    geolocation:
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Geolocation
                  }
                )
              end
              def to_hash
              end

              module Type
                extend Stagehand::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                BROWSERBASE =
                  T.let(
                    :browserbase,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Geolocation < Stagehand::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::BrowserbaseProxyConfig::Geolocation,
                      Stagehand::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :country

                sig { returns(T.nilable(String)) }
                attr_reader :city

                sig { params(city: String).void }
                attr_writer :city

                sig { returns(T.nilable(String)) }
                attr_reader :state

                sig { params(state: String).void }
                attr_writer :state

                sig do
                  params(country: String, city: String, state: String).returns(
                    T.attached_class
                  )
                end
                def self.new(country:, city: nil, state: nil)
                end

                sig do
                  override.returns(
                    { country: String, city: String, state: String }
                  )
                end
                def to_hash
                end
              end
            end

            class ExternalProxyConfig < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig,
                    Stagehand::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :server

              sig do
                returns(
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig { returns(T.nilable(String)) }
              attr_reader :domain_pattern

              sig { params(domain_pattern: String).void }
              attr_writer :domain_pattern

              sig { returns(T.nilable(String)) }
              attr_reader :password

              sig { params(password: String).void }
              attr_writer :password

              sig { returns(T.nilable(String)) }
              attr_reader :username

              sig { params(username: String).void }
              attr_writer :username

              sig do
                params(
                  server: String,
                  type:
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type::OrSymbol,
                  domain_pattern: String,
                  password: String,
                  username: String
                ).returns(T.attached_class)
              end
              def self.new(
                server:,
                type:,
                domain_pattern: nil,
                password: nil,
                username: nil
              )
              end

              sig do
                override.returns(
                  {
                    server: String,
                    type:
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type::OrSymbol,
                    domain_pattern: String,
                    password: String,
                    username: String
                  }
                )
              end
              def to_hash
              end

              module Type
                extend Stagehand::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                EXTERNAL =
                  T.let(
                    :external,
                    Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::ExternalProxyConfig::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::Variants
              ]
            )
          end
          def self.variants
          end

          UnionMember1Array =
            T.let(
              Stagehand::Internal::Type::ArrayOf[
                union:
                  Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Proxies::UnionMember1
              ],
              Stagehand::Internal::Type::Converter
            )
        end

        module Region
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          US_WEST_2 =
            T.let(
              :"us-west-2",
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::TaggedSymbol
            )
          US_EAST_1 =
            T.let(
              :"us-east-1",
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::TaggedSymbol
            )
          EU_CENTRAL_1 =
            T.let(
              :"eu-central-1",
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::TaggedSymbol
            )
          AP_SOUTHEAST_1 =
            T.let(
              :"ap-southeast-1",
              Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::Region::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Logging verbosity level (0=quiet, 1=normal, 2=debug)
      module Verbose
        extend Stagehand::Internal::Type::Enum

        TaggedFloat =
          T.type_alias { T.all(Float, Stagehand::SessionStartParams::Verbose) }
        OrFloat = T.type_alias { Float }

        VERBOSE_0 =
          T.let(0, Stagehand::SessionStartParams::Verbose::TaggedFloat)
        VERBOSE_1 =
          T.let(1, Stagehand::SessionStartParams::Verbose::TaggedFloat)
        VERBOSE_2 =
          T.let(2, Stagehand::SessionStartParams::Verbose::TaggedFloat)

        sig do
          override.returns(
            T::Array[Stagehand::SessionStartParams::Verbose::TaggedFloat]
          )
        end
        def self.values
        end
      end

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionStartParams::XLanguage)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TYPESCRIPT =
          T.let(
            :typescript,
            Stagehand::SessionStartParams::XLanguage::TaggedSymbol
          )
        PYTHON =
          T.let(:python, Stagehand::SessionStartParams::XLanguage::TaggedSymbol)
        PLAYGROUND =
          T.let(
            :playground,
            Stagehand::SessionStartParams::XLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionStartParams::XLanguage::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionStartParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionStartParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionStartParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionStartParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
