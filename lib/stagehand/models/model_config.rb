# frozen_string_literal: true

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      # @!attribute model_name
      #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
      #
      #   @return [String]
      required :model_name, String, api_name: :modelName

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

      # @!attribute provider
      #   AI provider for the model (or provide a baseURL endpoint instead)
      #
      #   @return [Symbol, Stagehand::Models::ModelConfig::Provider, nil]
      optional :provider, enum: -> { Stagehand::ModelConfig::Provider }

      # @!attribute provider_options
      #   Provider-specific options passed through to the AI SDK provider constructor. For
      #   Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
      #   project, location, googleAuthOptions }.
      #
      #   @return [Stagehand::Models::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions, nil]
      optional :provider_options,
               union: -> { Stagehand::ModelConfig::ProviderOptions },
               api_name: :providerOptions

      # @!attribute skip_api_key_fallback
      #   When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use
      #   this when auth is carried through providerOptions instead of an API key.
      #
      #   @return [Boolean, nil]
      optional :skip_api_key_fallback, Stagehand::Internal::Type::Boolean, api_name: :skipApiKeyFallback

      # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil, provider_options: nil, skip_api_key_fallback: nil)
      #   Some parameter documentations has been truncated, see
      #   {Stagehand::Models::ModelConfig} for more details.
      #
      #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
      #
      #   @param api_key [String] API key for the model provider
      #
      #   @param base_url [String] Base URL for the model provider
      #
      #   @param headers [Hash{Symbol=>String}] Custom headers for the model provider
      #
      #   @param provider [Symbol, Stagehand::Models::ModelConfig::Provider] AI provider for the model (or provide a baseURL endpoint instead)
      #
      #   @param provider_options [Stagehand::Models::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions] Provider-specific options passed through to the AI SDK provider constructor. For
      #
      #   @param skip_api_key_fallback [Boolean] When true, hosted sessions will not copy x-model-api-key into model.apiKey. Use

      # AI provider for the model (or provide a baseURL endpoint instead)
      #
      # @see Stagehand::Models::ModelConfig#provider
      module Provider
        extend Stagehand::Internal::Type::Enum

        OPENAI = :openai
        ANTHROPIC = :anthropic
        GOOGLE = :google
        MICROSOFT = :microsoft
        BEDROCK = :bedrock

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Provider-specific options passed through to the AI SDK provider constructor. For
      # Bedrock: { region, accessKeyId, secretAccessKey, sessionToken }. For Vertex: {
      # project, location, googleAuthOptions }.
      #
      # @see Stagehand::Models::ModelConfig#provider_options
      module ProviderOptions
        extend Stagehand::Internal::Type::Union

        variant -> { Stagehand::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions }

        variant -> { Stagehand::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions }

        variant -> { Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions }

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
          #   @return [Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions, nil]
          optional :google_auth_options,
                   -> {
                     Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions
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
          #   @param google_auth_options [Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions] Optional Google auth options for Vertex AI
          #
          #   @param headers [Hash{Symbol=>String}] Custom headers for Vertex AI requests
          #
          #   @param location [String] Google Cloud location for Vertex AI
          #
          #   @param project [String] Google Cloud project ID for Vertex AI

          # @see Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions#google_auth_options
          class GoogleAuthOptions < Stagehand::Internal::Type::BaseModel
            # @!attribute credentials
            #
            #   @return [Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials, nil]
            optional :credentials,
                     -> { Stagehand::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials }

            # @!method initialize(credentials: nil)
            #   Optional Google auth options for Vertex AI
            #
            #   @param credentials [Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions::Credentials]

            # @see Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions::GoogleAuthOptions#credentials
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
        #   @return [Array(Stagehand::Models::ModelConfig::ProviderOptions::BedrockAPIKeyProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::BedrockAwsCredentialsProviderOptions, Stagehand::Models::ModelConfig::ProviderOptions::GoogleVertexProviderOptions)]
      end
    end
  end
end
