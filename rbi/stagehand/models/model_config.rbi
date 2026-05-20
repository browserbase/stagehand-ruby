# typed: strong

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Stagehand::ModelConfig, Stagehand::Internal::AnyHash)
        end

      # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
      sig { returns(String) }
      attr_accessor :model_name

      # API key for the model provider
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Base URL for the model provider
      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig { params(base_url: String).void }
      attr_writer :base_url

      # google-auth-library options used to authenticate Vertex AI models
      sig { returns(T.nilable(Stagehand::ModelConfig::GoogleAuthOptions)) }
      attr_reader :google_auth_options

      sig do
        params(
          google_auth_options: Stagehand::ModelConfig::GoogleAuthOptions::OrHash
        ).void
      end
      attr_writer :google_auth_options

      # Custom headers sent with every request to the model provider
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Google Cloud location for Vertex AI models
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Google Cloud project ID for Vertex AI models
      sig { returns(T.nilable(String)) }
      attr_reader :project

      sig { params(project: String).void }
      attr_writer :project

      # AI provider for the model (or provide a baseURL endpoint instead)
      sig { returns(T.nilable(Stagehand::ModelConfig::Provider::OrSymbol)) }
      attr_reader :provider

      sig { params(provider: Stagehand::ModelConfig::Provider::OrSymbol).void }
      attr_writer :provider

      sig do
        params(
          model_name: String,
          api_key: String,
          base_url: String,
          google_auth_options:
            Stagehand::ModelConfig::GoogleAuthOptions::OrHash,
          headers: T::Hash[Symbol, String],
          location: String,
          project: String,
          provider: Stagehand::ModelConfig::Provider::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        model_name:,
        # API key for the model provider
        api_key: nil,
        # Base URL for the model provider
        base_url: nil,
        # google-auth-library options used to authenticate Vertex AI models
        google_auth_options: nil,
        # Custom headers sent with every request to the model provider
        headers: nil,
        # Google Cloud location for Vertex AI models
        location: nil,
        # Google Cloud project ID for Vertex AI models
        project: nil,
        # AI provider for the model (or provide a baseURL endpoint instead)
        provider: nil
      )
      end

      sig do
        override.returns(
          {
            model_name: String,
            api_key: String,
            base_url: String,
            google_auth_options: Stagehand::ModelConfig::GoogleAuthOptions,
            headers: T::Hash[Symbol, String],
            location: String,
            project: String,
            provider: Stagehand::ModelConfig::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      class GoogleAuthOptions < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::ModelConfig::GoogleAuthOptions,
              Stagehand::Internal::AnyHash
            )
          end

        # Google Cloud service account credentials
        sig do
          returns(
            T.nilable(Stagehand::ModelConfig::GoogleAuthOptions::Credentials)
          )
        end
        attr_reader :credentials

        sig do
          params(
            credentials:
              Stagehand::ModelConfig::GoogleAuthOptions::Credentials::OrHash
          ).void
        end
        attr_writer :credentials

        # Google Cloud project ID used by google-auth-library
        sig { returns(T.nilable(String)) }
        attr_reader :project_id

        sig { params(project_id: String).void }
        attr_writer :project_id

        # Google auth scopes for the desired API request
        sig do
          returns(
            T.nilable(
              Stagehand::ModelConfig::GoogleAuthOptions::Scopes::Variants
            )
          )
        end
        attr_reader :scopes

        sig do
          params(
            scopes: Stagehand::ModelConfig::GoogleAuthOptions::Scopes::Variants
          ).void
        end
        attr_writer :scopes

        # Google Cloud universe domain
        sig { returns(T.nilable(String)) }
        attr_reader :universe_domain

        sig { params(universe_domain: String).void }
        attr_writer :universe_domain

        # google-auth-library options used to authenticate Vertex AI models
        sig do
          params(
            credentials:
              Stagehand::ModelConfig::GoogleAuthOptions::Credentials::OrHash,
            project_id: String,
            scopes: Stagehand::ModelConfig::GoogleAuthOptions::Scopes::Variants,
            universe_domain: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Google Cloud service account credentials
          credentials: nil,
          # Google Cloud project ID used by google-auth-library
          project_id: nil,
          # Google auth scopes for the desired API request
          scopes: nil,
          # Google Cloud universe domain
          universe_domain: nil
        )
        end

        sig do
          override.returns(
            {
              credentials:
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials,
              project_id: String,
              scopes:
                Stagehand::ModelConfig::GoogleAuthOptions::Scopes::Variants,
              universe_domain: String
            }
          )
        end
        def to_hash
        end

        class Credentials < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials,
                Stagehand::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :client_email

          sig { returns(String) }
          attr_accessor :private_key

          sig { returns(T.nilable(String)) }
          attr_reader :auth_provider_x509_cert_url

          sig { params(auth_provider_x509_cert_url: String).void }
          attr_writer :auth_provider_x509_cert_url

          sig { returns(T.nilable(String)) }
          attr_reader :auth_uri

          sig { params(auth_uri: String).void }
          attr_writer :auth_uri

          sig { returns(T.nilable(String)) }
          attr_reader :client_id

          sig { params(client_id: String).void }
          attr_writer :client_id

          sig { returns(T.nilable(String)) }
          attr_reader :client_x509_cert_url

          sig { params(client_x509_cert_url: String).void }
          attr_writer :client_x509_cert_url

          sig { returns(T.nilable(String)) }
          attr_reader :private_key_id

          sig { params(private_key_id: String).void }
          attr_writer :private_key_id

          sig { returns(T.nilable(String)) }
          attr_reader :project_id

          sig { params(project_id: String).void }
          attr_writer :project_id

          sig { returns(T.nilable(String)) }
          attr_reader :token_uri

          sig { params(token_uri: String).void }
          attr_writer :token_uri

          sig do
            returns(
              T.nilable(
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig { returns(T.nilable(String)) }
          attr_reader :universe_domain

          sig { params(universe_domain: String).void }
          attr_writer :universe_domain

          # Google Cloud service account credentials
          sig do
            params(
              client_email: String,
              private_key: String,
              auth_provider_x509_cert_url: String,
              auth_uri: String,
              client_id: String,
              client_x509_cert_url: String,
              private_key_id: String,
              project_id: String,
              token_uri: String,
              type:
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::OrSymbol,
              universe_domain: String
            ).returns(T.attached_class)
          end
          def self.new(
            client_email:,
            private_key:,
            auth_provider_x509_cert_url: nil,
            auth_uri: nil,
            client_id: nil,
            client_x509_cert_url: nil,
            private_key_id: nil,
            project_id: nil,
            token_uri: nil,
            type: nil,
            universe_domain: nil
          )
          end

          sig do
            override.returns(
              {
                client_email: String,
                private_key: String,
                auth_provider_x509_cert_url: String,
                auth_uri: String,
                client_id: String,
                client_x509_cert_url: String,
                private_key_id: String,
                project_id: String,
                token_uri: String,
                type:
                  Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::OrSymbol,
                universe_domain: String
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
                  Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SERVICE_ACCOUNT =
              T.let(
                :service_account,
                Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # Google auth scopes for the desired API request
        module Scopes
          extend Stagehand::Internal::Type::Union

          Variants = T.type_alias { T.any(String, T::Array[String]) }

          sig do
            override.returns(
              T::Array[
                Stagehand::ModelConfig::GoogleAuthOptions::Scopes::Variants
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
      end

      # AI provider for the model (or provide a baseURL endpoint instead)
      module Provider
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::ModelConfig::Provider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI = T.let(:openai, Stagehand::ModelConfig::Provider::TaggedSymbol)
        ANTHROPIC =
          T.let(:anthropic, Stagehand::ModelConfig::Provider::TaggedSymbol)
        GOOGLE = T.let(:google, Stagehand::ModelConfig::Provider::TaggedSymbol)
        MICROSOFT =
          T.let(:microsoft, Stagehand::ModelConfig::Provider::TaggedSymbol)
        BEDROCK =
          T.let(:bedrock, Stagehand::ModelConfig::Provider::TaggedSymbol)
        VERTEX = T.let(:vertex, Stagehand::ModelConfig::Provider::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Stagehand::ModelConfig::Provider::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
