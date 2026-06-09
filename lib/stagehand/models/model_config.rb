# frozen_string_literal: true

module Stagehand
  module Models
    module ModelConfig
      extend Stagehand::Internal::Type::Union

      variant -> { Stagehand::ModelConfig::VertexModelConfigObject }

      variant -> { Stagehand::ModelConfig::AzureEntraModelConfigObject }

      variant -> { Stagehand::ModelConfig::AzureAPIKeyModelConfigObject }

      variant -> { Stagehand::ModelConfig::GenericModelConfigObject }

      class VertexModelConfigObject < Stagehand::Internal::Type::BaseModel
        # @!attribute auth
        #   Vertex provider authentication configuration
        #
        #   @return [Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth]
        required :auth, -> { Stagehand::ModelConfig::VertexModelConfigObject::Auth }

        # @!attribute model_name
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @return [String]
        required :model_name, String, api_name: :modelName

        # @!attribute provider
        #   Vertex AI model provider
        #
        #   @return [Symbol, :vertex]
        required :provider, const: :vertex

        # @!attribute provider_options
        #   Vertex provider-specific model configuration
        #
        #   @return [Stagehand::Models::ModelConfig::VertexModelConfigObject::ProviderOptions]
        required :provider_options,
                 -> { Stagehand::ModelConfig::VertexModelConfigObject::ProviderOptions },
                 api_name: :providerOptions

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
        #   Custom headers sent with every request to the model provider
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Stagehand::Internal::Type::HashOf[String]

        # @!method initialize(auth:, model_name:, provider_options:, api_key: nil, base_url: nil, headers: nil, provider: :vertex)
        #   @param auth [Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth] Vertex provider authentication configuration
        #
        #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @param provider_options [Stagehand::Models::ModelConfig::VertexModelConfigObject::ProviderOptions] Vertex provider-specific model configuration
        #
        #   @param api_key [String] API key for the model provider
        #
        #   @param base_url [String] Base URL for the model provider
        #
        #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
        #
        #   @param provider [Symbol, :vertex] Vertex AI model provider

        # @see Stagehand::Models::ModelConfig::VertexModelConfigObject#auth
        class Auth < Stagehand::Internal::Type::BaseModel
          # @!attribute credentials
          #   Google Cloud service account credentials
          #
          #   @return [Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Credentials]
          required :credentials, -> { Stagehand::ModelConfig::VertexModelConfigObject::Auth::Credentials }

          # @!attribute type
          #   Use inline Google Cloud service account credentials for provider authentication
          #
          #   @return [Symbol, :googleServiceAccount]
          required :type, const: :googleServiceAccount

          # @!attribute project_id
          #   Google Cloud project ID used by google-auth-library
          #
          #   @return [String, nil]
          optional :project_id, String, api_name: :projectId

          # @!attribute scopes
          #   Google auth scopes for the desired API request
          #
          #   @return [String, Array<String>, nil]
          optional :scopes, union: -> { Stagehand::ModelConfig::VertexModelConfigObject::Auth::Scopes }

          # @!attribute universe_domain
          #   Google Cloud universe domain
          #
          #   @return [String, nil]
          optional :universe_domain, String, api_name: :universeDomain

          # @!method initialize(credentials:, project_id: nil, scopes: nil, universe_domain: nil, type: :googleServiceAccount)
          #   Vertex provider authentication configuration
          #
          #   @param credentials [Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Credentials] Google Cloud service account credentials
          #
          #   @param project_id [String] Google Cloud project ID used by google-auth-library
          #
          #   @param scopes [String, Array<String>] Google auth scopes for the desired API request
          #
          #   @param universe_domain [String] Google Cloud universe domain
          #
          #   @param type [Symbol, :googleServiceAccount] Use inline Google Cloud service account credentials for provider authentication

          # @see Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth#credentials
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
            #   @return [Symbol, Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Credentials::Type, nil]
            optional :type, enum: -> { Stagehand::ModelConfig::VertexModelConfigObject::Auth::Credentials::Type }

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
            #   @param type [Symbol, Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Credentials::Type]
            #   @param universe_domain [String]

            # @see Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Credentials#type
            module Type
              extend Stagehand::Internal::Type::Enum

              SERVICE_ACCOUNT = :service_account

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # Google auth scopes for the desired API request
          #
          # @see Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth#scopes
          module Scopes
            extend Stagehand::Internal::Type::Union

            variant String

            variant -> { Stagehand::Models::ModelConfig::VertexModelConfigObject::Auth::Scopes::StringArray }

            # @!method self.variants
            #   @return [Array(String, Array<String>)]

            # @type [Stagehand::Internal::Type::Converter]
            StringArray = Stagehand::Internal::Type::ArrayOf[String]
          end
        end

        # @see Stagehand::Models::ModelConfig::VertexModelConfigObject#provider_options
        class ProviderOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute vertex
          #   Vertex AI provider-specific settings
          #
          #   @return [Stagehand::Models::ModelConfig::VertexModelConfigObject::ProviderOptions::Vertex]
          required :vertex, -> { Stagehand::ModelConfig::VertexModelConfigObject::ProviderOptions::Vertex }

          # @!method initialize(vertex:)
          #   Vertex provider-specific model configuration
          #
          #   @param vertex [Stagehand::Models::ModelConfig::VertexModelConfigObject::ProviderOptions::Vertex] Vertex AI provider-specific settings

          # @see Stagehand::Models::ModelConfig::VertexModelConfigObject::ProviderOptions#vertex
          class Vertex < Stagehand::Internal::Type::BaseModel
            # @!attribute location
            #   Google Cloud location for Vertex AI models
            #
            #   @return [String]
            required :location, String

            # @!attribute project
            #   Google Cloud project ID for Vertex AI models
            #
            #   @return [String]
            required :project, String

            # @!attribute base_url
            #   Base URL for the Vertex AI provider
            #
            #   @return [String, nil]
            optional :base_url, String, api_name: :baseURL

            # @!attribute headers
            #   Custom headers sent with every request to the Vertex AI provider
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :headers, Stagehand::Internal::Type::HashOf[String]

            # @!method initialize(location:, project:, base_url: nil, headers: nil)
            #   Vertex AI provider-specific settings
            #
            #   @param location [String] Google Cloud location for Vertex AI models
            #
            #   @param project [String] Google Cloud project ID for Vertex AI models
            #
            #   @param base_url [String] Base URL for the Vertex AI provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the Vertex AI provider
          end
        end
      end

      class AzureEntraModelConfigObject < Stagehand::Internal::Type::BaseModel
        # @!attribute auth
        #   Azure provider authentication configuration
        #
        #   @return [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::Auth]
        required :auth, -> { Stagehand::ModelConfig::AzureEntraModelConfigObject::Auth }

        # @!attribute model_name
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @return [String]
        required :model_name, String, api_name: :modelName

        # @!attribute provider
        #   Azure OpenAI model provider
        #
        #   @return [Symbol, :azure]
        required :provider, const: :azure

        # @!attribute provider_options
        #   Azure provider-specific model configuration
        #
        #   @return [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::ProviderOptions]
        required :provider_options,
                 -> { Stagehand::ModelConfig::AzureEntraModelConfigObject::ProviderOptions },
                 api_name: :providerOptions

        # @!attribute base_url
        #   Base URL for the model provider
        #
        #   @return [String, nil]
        optional :base_url, String, api_name: :baseURL

        # @!attribute headers
        #   Custom headers sent with every request to the model provider
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Stagehand::Internal::Type::HashOf[String]

        # @!method initialize(auth:, model_name:, provider_options:, base_url: nil, headers: nil, provider: :azure)
        #   @param auth [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::Auth] Azure provider authentication configuration
        #
        #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @param provider_options [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::ProviderOptions] Azure provider-specific model configuration
        #
        #   @param base_url [String] Base URL for the model provider
        #
        #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
        #
        #   @param provider [Symbol, :azure] Azure OpenAI model provider

        # @see Stagehand::Models::ModelConfig::AzureEntraModelConfigObject#auth
        class Auth < Stagehand::Internal::Type::BaseModel
          # @!attribute token
          #   Microsoft Entra ID bearer token for Azure OpenAI
          #
          #   @return [String]
          required :token, String

          # @!attribute type
          #   Use a Microsoft Entra ID bearer token for authentication
          #
          #   @return [Symbol, :azureEntraId]
          required :type, const: :azureEntraId

          # @!method initialize(token:, type: :azureEntraId)
          #   Azure provider authentication configuration
          #
          #   @param token [String] Microsoft Entra ID bearer token for Azure OpenAI
          #
          #   @param type [Symbol, :azureEntraId] Use a Microsoft Entra ID bearer token for authentication
        end

        # @see Stagehand::Models::ModelConfig::AzureEntraModelConfigObject#provider_options
        class ProviderOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute azure
          #   Azure OpenAI provider-specific settings
          #
          #   @return [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::ProviderOptions::Azure]
          required :azure, -> { Stagehand::ModelConfig::AzureEntraModelConfigObject::ProviderOptions::Azure }

          # @!method initialize(azure:)
          #   Azure provider-specific model configuration
          #
          #   @param azure [Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

          # @see Stagehand::Models::ModelConfig::AzureEntraModelConfigObject::ProviderOptions#azure
          class Azure < Stagehand::Internal::Type::BaseModel
            # @!attribute api_version
            #   Azure OpenAI API version
            #
            #   @return [String, nil]
            optional :api_version, String, api_name: :apiVersion

            # @!attribute base_url
            #   Base URL for the Azure OpenAI provider
            #
            #   @return [String, nil]
            optional :base_url, String, api_name: :baseURL

            # @!attribute headers
            #   Custom headers sent with every request to the Azure OpenAI provider
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :headers, Stagehand::Internal::Type::HashOf[String]

            # @!attribute resource_name
            #   Azure OpenAI resource name
            #
            #   @return [String, nil]
            optional :resource_name, String, api_name: :resourceName

            # @!attribute use_deployment_based_urls
            #   Whether to use deployment-based Azure OpenAI URLs
            #
            #   @return [Boolean, nil]
            optional :use_deployment_based_urls,
                     Stagehand::Internal::Type::Boolean,
                     api_name: :useDeploymentBasedUrls

            # @!method initialize(api_version: nil, base_url: nil, headers: nil, resource_name: nil, use_deployment_based_urls: nil)
            #   Azure OpenAI provider-specific settings
            #
            #   @param api_version [String] Azure OpenAI API version
            #
            #   @param base_url [String] Base URL for the Azure OpenAI provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the Azure OpenAI provider
            #
            #   @param resource_name [String] Azure OpenAI resource name
            #
            #   @param use_deployment_based_urls [Boolean] Whether to use deployment-based Azure OpenAI URLs
          end
        end
      end

      class AzureAPIKeyModelConfigObject < Stagehand::Internal::Type::BaseModel
        # @!attribute model_name
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @return [String]
        required :model_name, String, api_name: :modelName

        # @!attribute provider
        #   Azure OpenAI model provider
        #
        #   @return [Symbol, :azure]
        required :provider, const: :azure

        # @!attribute provider_options
        #   Azure provider-specific model configuration
        #
        #   @return [Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions]
        required :provider_options,
                 -> { Stagehand::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions },
                 api_name: :providerOptions

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
        #   Custom headers sent with every request to the model provider
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Stagehand::Internal::Type::HashOf[String]

        # @!method initialize(model_name:, provider_options:, api_key: nil, base_url: nil, headers: nil, provider: :azure)
        #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @param provider_options [Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions] Azure provider-specific model configuration
        #
        #   @param api_key [String] API key for the model provider
        #
        #   @param base_url [String] Base URL for the model provider
        #
        #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
        #
        #   @param provider [Symbol, :azure] Azure OpenAI model provider

        # @see Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject#provider_options
        class ProviderOptions < Stagehand::Internal::Type::BaseModel
          # @!attribute azure
          #   Azure OpenAI provider-specific settings
          #
          #   @return [Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions::Azure]
          required :azure, -> { Stagehand::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions::Azure }

          # @!method initialize(azure:)
          #   Azure provider-specific model configuration
          #
          #   @param azure [Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

          # @see Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject::ProviderOptions#azure
          class Azure < Stagehand::Internal::Type::BaseModel
            # @!attribute api_version
            #   Azure OpenAI API version
            #
            #   @return [String, nil]
            optional :api_version, String, api_name: :apiVersion

            # @!attribute base_url
            #   Base URL for the Azure OpenAI provider
            #
            #   @return [String, nil]
            optional :base_url, String, api_name: :baseURL

            # @!attribute headers
            #   Custom headers sent with every request to the Azure OpenAI provider
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :headers, Stagehand::Internal::Type::HashOf[String]

            # @!attribute resource_name
            #   Azure OpenAI resource name
            #
            #   @return [String, nil]
            optional :resource_name, String, api_name: :resourceName

            # @!attribute use_deployment_based_urls
            #   Whether to use deployment-based Azure OpenAI URLs
            #
            #   @return [Boolean, nil]
            optional :use_deployment_based_urls,
                     Stagehand::Internal::Type::Boolean,
                     api_name: :useDeploymentBasedUrls

            # @!method initialize(api_version: nil, base_url: nil, headers: nil, resource_name: nil, use_deployment_based_urls: nil)
            #   Azure OpenAI provider-specific settings
            #
            #   @param api_version [String] Azure OpenAI API version
            #
            #   @param base_url [String] Base URL for the Azure OpenAI provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the Azure OpenAI provider
            #
            #   @param resource_name [String] Azure OpenAI resource name
            #
            #   @param use_deployment_based_urls [Boolean] Whether to use deployment-based Azure OpenAI URLs
          end
        end
      end

      class GenericModelConfigObject < Stagehand::Internal::Type::BaseModel
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
        #   Custom headers sent with every request to the model provider
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Stagehand::Internal::Type::HashOf[String]

        # @!attribute provider
        #   AI provider for the model (or provide a baseURL endpoint instead)
        #
        #   @return [Symbol, Stagehand::Models::ModelConfig::GenericModelConfigObject::Provider, nil]
        optional :provider, enum: -> { Stagehand::ModelConfig::GenericModelConfigObject::Provider }

        # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil)
        #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
        #
        #   @param api_key [String] API key for the model provider
        #
        #   @param base_url [String] Base URL for the model provider
        #
        #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
        #
        #   @param provider [Symbol, Stagehand::Models::ModelConfig::GenericModelConfigObject::Provider] AI provider for the model (or provide a baseURL endpoint instead)

        # AI provider for the model (or provide a baseURL endpoint instead)
        #
        # @see Stagehand::Models::ModelConfig::GenericModelConfigObject#provider
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
      end

      # @!method self.variants
      #   @return [Array(Stagehand::Models::ModelConfig::VertexModelConfigObject, Stagehand::Models::ModelConfig::AzureEntraModelConfigObject, Stagehand::Models::ModelConfig::AzureAPIKeyModelConfigObject, Stagehand::Models::ModelConfig::GenericModelConfigObject)]
    end
  end
end
