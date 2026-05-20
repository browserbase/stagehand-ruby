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

      # @!attribute google_auth_options
      #   google-auth-library options used to authenticate Vertex AI models
      #
      #   @return [Stagehand::Models::ModelConfig::GoogleAuthOptions, nil]
      optional :google_auth_options,
               -> { Stagehand::ModelConfig::GoogleAuthOptions },
               api_name: :googleAuthOptions

      # @!attribute headers
      #   Custom headers sent with every request to the model provider
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Stagehand::Internal::Type::HashOf[String]

      # @!attribute location
      #   Google Cloud location for Vertex AI models
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute project
      #   Google Cloud project ID for Vertex AI models
      #
      #   @return [String, nil]
      optional :project, String

      # @!attribute provider
      #   AI provider for the model (or provide a baseURL endpoint instead)
      #
      #   @return [Symbol, Stagehand::Models::ModelConfig::Provider, nil]
      optional :provider, enum: -> { Stagehand::ModelConfig::Provider }

      # @!method initialize(model_name:, api_key: nil, base_url: nil, google_auth_options: nil, headers: nil, location: nil, project: nil, provider: nil)
      #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
      #
      #   @param api_key [String] API key for the model provider
      #
      #   @param base_url [String] Base URL for the model provider
      #
      #   @param google_auth_options [Stagehand::Models::ModelConfig::GoogleAuthOptions] google-auth-library options used to authenticate Vertex AI models
      #
      #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
      #
      #   @param location [String] Google Cloud location for Vertex AI models
      #
      #   @param project [String] Google Cloud project ID for Vertex AI models
      #
      #   @param provider [Symbol, Stagehand::Models::ModelConfig::Provider] AI provider for the model (or provide a baseURL endpoint instead)

      # @see Stagehand::Models::ModelConfig#google_auth_options
      class GoogleAuthOptions < Stagehand::Internal::Type::BaseModel
        # @!attribute credentials
        #   Google Cloud service account credentials
        #
        #   @return [Stagehand::Models::ModelConfig::GoogleAuthOptions::Credentials, nil]
        optional :credentials, -> { Stagehand::ModelConfig::GoogleAuthOptions::Credentials }

        # @!attribute project_id
        #   Google Cloud project ID used by google-auth-library
        #
        #   @return [String, nil]
        optional :project_id, String, api_name: :projectId

        # @!attribute scopes
        #   Google auth scopes for the desired API request
        #
        #   @return [String, Array<String>, nil]
        optional :scopes, union: -> { Stagehand::ModelConfig::GoogleAuthOptions::Scopes }

        # @!attribute universe_domain
        #   Google Cloud universe domain
        #
        #   @return [String, nil]
        optional :universe_domain, String, api_name: :universeDomain

        # @!method initialize(credentials: nil, project_id: nil, scopes: nil, universe_domain: nil)
        #   google-auth-library options used to authenticate Vertex AI models
        #
        #   @param credentials [Stagehand::Models::ModelConfig::GoogleAuthOptions::Credentials] Google Cloud service account credentials
        #
        #   @param project_id [String] Google Cloud project ID used by google-auth-library
        #
        #   @param scopes [String, Array<String>] Google auth scopes for the desired API request
        #
        #   @param universe_domain [String] Google Cloud universe domain

        # @see Stagehand::Models::ModelConfig::GoogleAuthOptions#credentials
        class Credentials < Stagehand::Internal::Type::BaseModel
          # @!attribute client_email
          #
          #   @return [String]
          required :client_email, String

          # @!attribute private_key
          #
          #   @return [String]
          required :private_key, String

          # @!attribute auth_provider_x509_cert_url
          #
          #   @return [String, nil]
          optional :auth_provider_x509_cert_url, String

          # @!attribute auth_uri
          #
          #   @return [String, nil]
          optional :auth_uri, String

          # @!attribute client_id
          #
          #   @return [String, nil]
          optional :client_id, String

          # @!attribute client_x509_cert_url
          #
          #   @return [String, nil]
          optional :client_x509_cert_url, String

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
          #   @return [Symbol, Stagehand::Models::ModelConfig::GoogleAuthOptions::Credentials::Type, nil]
          optional :type, enum: -> { Stagehand::ModelConfig::GoogleAuthOptions::Credentials::Type }

          # @!attribute universe_domain
          #
          #   @return [String, nil]
          optional :universe_domain, String

          # @!method initialize(client_email:, private_key:, auth_provider_x509_cert_url: nil, auth_uri: nil, client_id: nil, client_x509_cert_url: nil, private_key_id: nil, project_id: nil, token_uri: nil, type: nil, universe_domain: nil)
          #   Google Cloud service account credentials
          #
          #   @param client_email [String]
          #   @param private_key [String]
          #   @param auth_provider_x509_cert_url [String]
          #   @param auth_uri [String]
          #   @param client_id [String]
          #   @param client_x509_cert_url [String]
          #   @param private_key_id [String]
          #   @param project_id [String]
          #   @param token_uri [String]
          #   @param type [Symbol, Stagehand::Models::ModelConfig::GoogleAuthOptions::Credentials::Type]
          #   @param universe_domain [String]

          # @see Stagehand::Models::ModelConfig::GoogleAuthOptions::Credentials#type
          module Type
            extend Stagehand::Internal::Type::Enum

            SERVICE_ACCOUNT = :service_account

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # Google auth scopes for the desired API request
        #
        # @see Stagehand::Models::ModelConfig::GoogleAuthOptions#scopes
        module Scopes
          extend Stagehand::Internal::Type::Union

          variant String

          variant -> { Stagehand::Models::ModelConfig::GoogleAuthOptions::Scopes::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [Stagehand::Internal::Type::Converter]
          StringArray = Stagehand::Internal::Type::ArrayOf[String]
        end
      end

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
        VERTEX = :vertex

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
