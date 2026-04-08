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

      # Custom headers for the model provider
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # AI provider for the model (or provide a baseURL endpoint instead)
      sig { returns(T.nilable(Stagehand::ModelConfig::Provider::OrSymbol)) }
      attr_reader :provider

      sig { params(provider: Stagehand::ModelConfig::Provider::OrSymbol).void }
      attr_writer :provider

      # Provider-specific options passed through to the AI SDK provider constructor. For
      # Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
      # project, location, googleAuthOptions }.
      sig do
        returns(
          T.nilable(
            T.any(
              Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions,
              Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions,
              Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions
            )
          )
        )
      end
      attr_reader :provider_options

      sig do
        params(
          provider_options:
            T.any(
              Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions::OrHash,
              Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions::OrHash,
              Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::OrHash
            )
        ).void
      end
      attr_writer :provider_options

      # When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
      # this when auth is carried through providerOptions instead of an API key.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :skip_api_key_fallback

      sig { params(skip_api_key_fallback: T::Boolean).void }
      attr_writer :skip_api_key_fallback

      sig do
        params(
          model_name: String,
          api_key: String,
          base_url: String,
          headers: T::Hash[Symbol, String],
          provider: Stagehand::ModelConfig::Provider::OrSymbol,
          provider_options:
            T.any(
              Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions::OrHash,
              Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions::OrHash,
              Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::OrHash
            ),
          skip_api_key_fallback: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        model_name:,
        # API key for the model provider
        api_key: nil,
        # Base URL for the model provider
        base_url: nil,
        # Custom headers for the model provider
        headers: nil,
        # AI provider for the model (or provide a baseURL endpoint instead)
        provider: nil,
        # Provider-specific options passed through to the AI SDK provider constructor. For
        # Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
        # project, location, googleAuthOptions }.
        provider_options: nil,
        # When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
        # this when auth is carried through providerOptions instead of an API key.
        skip_api_key_fallback: nil
      )
      end

      sig do
        override.returns(
          {
            model_name: String,
            api_key: String,
            base_url: String,
            headers: T::Hash[Symbol, String],
            provider: Stagehand::ModelConfig::Provider::OrSymbol,
            provider_options:
              T.any(
                Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions,
                Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions,
                Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions
              ),
            skip_api_key_fallback: T::Boolean
          }
        )
      end
      def to_hash
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

        sig do
          override.returns(
            T::Array[Stagehand::ModelConfig::Provider::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Provider-specific options passed through to the AI SDK provider constructor. For
      # Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
      # project, location, googleAuthOptions }.
      module ProviderOptions
        extend Stagehand::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions,
              Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions,
              Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions
            )
          end

        class BedrockAPIKeyProviderOptions < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions,
                Stagehand::Internal::AnyHash
              )
            end

          # AWS region for Amazon Bedrock
          sig { returns(String) }
          attr_accessor :region

          sig { params(region: String).returns(T.attached_class) }
          def self.new(
            # AWS region for Amazon Bedrock
            region:
          )
          end

          sig { override.returns({ region: String }) }
          def to_hash
          end
        end

        class BedrockAwsCredentialsProviderOptions < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions,
                Stagehand::Internal::AnyHash
              )
            end

          # AWS access key ID for Bedrock
          sig { returns(String) }
          attr_accessor :access_key_id

          # AWS region for Amazon Bedrock
          sig { returns(String) }
          attr_accessor :region

          # AWS secret access key for Bedrock
          sig { returns(String) }
          attr_accessor :secret_access_key

          # Optional AWS session token for temporary credentials
          sig { returns(T.nilable(String)) }
          attr_reader :session_token

          sig { params(session_token: String).void }
          attr_writer :session_token

          sig do
            params(
              access_key_id: String,
              region: String,
              secret_access_key: String,
              session_token: String
            ).returns(T.attached_class)
          end
          def self.new(
            # AWS access key ID for Bedrock
            access_key_id:,
            # AWS region for Amazon Bedrock
            region:,
            # AWS secret access key for Bedrock
            secret_access_key:,
            # Optional AWS session token for temporary credentials
            session_token: nil
          )
          end

          sig do
            override.returns(
              {
                access_key_id: String,
                region: String,
                secret_access_key: String,
                session_token: String
              }
            )
          end
          def to_hash
          end
        end

        class GoogleVertexProviderOptions < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions,
                Stagehand::Internal::AnyHash
              )
            end

          # Optional Google auth options for Vertex AI
          sig do
            returns(
              T.nilable(
                Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions
              )
            )
          end
          attr_reader :google_auth_options

          sig do
            params(
              google_auth_options:
                Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::OrHash
            ).void
          end
          attr_writer :google_auth_options

          # Custom headers for Vertex AI requests
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :headers

          sig { params(headers: T::Hash[Symbol, String]).void }
          attr_writer :headers

          # Google Cloud location for Vertex AI
          sig { returns(T.nilable(String)) }
          attr_reader :location

          sig { params(location: String).void }
          attr_writer :location

          # Google Cloud project ID for Vertex AI
          sig { returns(T.nilable(String)) }
          attr_reader :project

          sig { params(project: String).void }
          attr_writer :project

          sig do
            params(
              google_auth_options:
                Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::OrHash,
              headers: T::Hash[Symbol, String],
              location: String,
              project: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Optional Google auth options for Vertex AI
            google_auth_options: nil,
            # Custom headers for Vertex AI requests
            headers: nil,
            # Google Cloud location for Vertex AI
            location: nil,
            # Google Cloud project ID for Vertex AI
            project: nil
          )
          end

          sig do
            override.returns(
              {
                google_auth_options:
                  Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions,
                headers: T::Hash[Symbol, String],
                location: String,
                project: String
              }
            )
          end
          def to_hash
          end

          class GoogleAuthOptions < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions,
                  Stagehand::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials
                )
              )
            end
            attr_reader :credentials

            sig do
              params(
                credentials:
                  Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials::OrHash
              ).void
            end
            attr_writer :credentials

            # Optional Google auth options for Vertex AI
            sig do
              params(
                credentials:
                  Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials::OrHash
              ).returns(T.attached_class)
            end
            def self.new(credentials: nil)
            end

            sig do
              override.returns(
                {
                  credentials:
                    Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials
                }
              )
            end
            def to_hash
            end

            class Credentials < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials,
                    Stagehand::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :auth_provider_x509_cert_url

              sig { params(auth_provider_x509_cert_url: String).void }
              attr_writer :auth_provider_x509_cert_url

              sig { returns(T.nilable(String)) }
              attr_reader :auth_uri

              sig { params(auth_uri: String).void }
              attr_writer :auth_uri

              sig { returns(T.nilable(String)) }
              attr_reader :client_email

              sig { params(client_email: String).void }
              attr_writer :client_email

              sig { returns(T.nilable(String)) }
              attr_reader :client_id

              sig { params(client_id: String).void }
              attr_writer :client_id

              sig { returns(T.nilable(String)) }
              attr_reader :client_x509_cert_url

              sig { params(client_x509_cert_url: String).void }
              attr_writer :client_x509_cert_url

              sig { returns(T.nilable(String)) }
              attr_reader :private_key

              sig { params(private_key: String).void }
              attr_writer :private_key

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

              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              sig { returns(T.nilable(String)) }
              attr_reader :universe_domain

              sig { params(universe_domain: String).void }
              attr_writer :universe_domain

              sig do
                params(
                  auth_provider_x509_cert_url: String,
                  auth_uri: String,
                  client_email: String,
                  client_id: String,
                  client_x509_cert_url: String,
                  private_key: String,
                  private_key_id: String,
                  project_id: String,
                  token_uri: String,
                  type: String,
                  universe_domain: String
                ).returns(T.attached_class)
              end
              def self.new(
                auth_provider_x509_cert_url: nil,
                auth_uri: nil,
                client_email: nil,
                client_id: nil,
                client_x509_cert_url: nil,
                private_key: nil,
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
                    auth_provider_x509_cert_url: String,
                    auth_uri: String,
                    client_email: String,
                    client_id: String,
                    client_x509_cert_url: String,
                    private_key: String,
                    private_key_id: String,
                    project_id: String,
                    token_uri: String,
                    type: String,
                    universe_domain: String
                  }
                )
              end
              def to_hash
              end
            end
          end
        end

        sig do
          override.returns(
            T::Array[Stagehand::ModelConfig::ProviderOptions::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
