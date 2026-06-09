# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#execute
    #
    # @see Stagehand::Resources::Sessions#execute_streaming
    class SessionExecuteParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute id
      #   Unique session identifier
      #
      #   @return [String]
      required :id, String

      # @!attribute agent_config
      #
      #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig]
      required :agent_config, -> { Stagehand::SessionExecuteParams::AgentConfig }, api_name: :agentConfig

      # @!attribute execute_options
      #
      #   @return [Stagehand::Models::SessionExecuteParams::ExecuteOptions]
      required :execute_options,
               -> { Stagehand::SessionExecuteParams::ExecuteOptions },
               api_name: :executeOptions

      # @!attribute frame_id
      #   Target frame ID for the agent
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute should_cache
      #   If true, the server captures a cache entry and returns it to the client
      #
      #   @return [Boolean, nil]
      optional :should_cache, Stagehand::Internal::Type::Boolean, api_name: :shouldCache

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionExecuteParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionExecuteParams::XStreamResponse }

      # @!method initialize(id:, agent_config:, execute_options:, frame_id: nil, should_cache: nil, x_stream_response: nil, request_options: {})
      #   @param id [String] Unique session identifier
      #
      #   @param agent_config [Stagehand::Models::SessionExecuteParams::AgentConfig]
      #
      #   @param execute_options [Stagehand::Models::SessionExecuteParams::ExecuteOptions]
      #
      #   @param frame_id [String, nil] Target frame ID for the agent
      #
      #   @param should_cache [Boolean] If true, the server captures a cache entry and returns it to the client
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionExecuteParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class AgentConfig < Stagehand::Internal::Type::BaseModel
        # @!attribute cua
        #   Deprecated. Use mode: 'cua' instead. If both are provided, mode takes
        #   precedence.
        #
        #   @return [Boolean, nil]
        optional :cua, Stagehand::Internal::Type::Boolean

        # @!attribute execution_model
        #   Model configuration object or model name string (e.g., 'openai/gpt-5-nano') for
        #   tool execution (observe/act calls within agent tools). If not specified,
        #   inherits from the main model configuration.
        #
        #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject, String, nil]
        optional :execution_model,
                 union: -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel },
                 api_name: :executionModel

        # @!attribute mode
        #   Tool mode for the agent (dom, hybrid, cua). If set, overrides cua.
        #
        #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Mode, nil]
        optional :mode, enum: -> { Stagehand::SessionExecuteParams::AgentConfig::Mode }

        # @!attribute model
        #   Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject, String, nil]
        optional :model, union: -> { Stagehand::SessionExecuteParams::AgentConfig::Model }

        # @!attribute provider
        #   AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Provider, nil]
        optional :provider, enum: -> { Stagehand::SessionExecuteParams::AgentConfig::Provider }

        # @!attribute system_prompt
        #   Custom system prompt for the agent
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!method initialize(cua: nil, execution_model: nil, mode: nil, model: nil, provider: nil, system_prompt: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionExecuteParams::AgentConfig} for more details.
        #
        #   @param cua [Boolean] Deprecated. Use mode: 'cua' instead. If both are provided, mode takes precedence
        #
        #   @param execution_model [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject, String] Model configuration object or model name string (e.g., 'openai/gpt-5-nano') for
        #
        #   @param mode [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Mode] Tool mode for the agent (dom, hybrid, cua). If set, overrides cua.
        #
        #   @param model [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject, String] Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @param provider [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Provider] AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @param system_prompt [String] Custom system prompt for the agent

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano') for
        # tool execution (observe/act calls within agent tools). If not specified,
        # inherits from the main model configuration.
        #
        # @see Stagehand::Models::SessionExecuteParams::AgentConfig#execution_model
        module ExecutionModel
          extend Stagehand::Internal::Type::Union

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject }

          variant String

          class VertexModelConfigObject < Stagehand::Internal::Type::BaseModel
            # @!attribute auth
            #   Vertex provider authentication configuration
            #
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth]
            required :auth,
                     -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions
                     },
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
            #   @param auth [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth] Vertex provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions] Vertex provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :vertex] Vertex AI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject#auth
            class Auth < Stagehand::Internal::Type::BaseModel
              # @!attribute credentials
              #   Google Cloud service account credentials
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials]
              required :credentials,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials }

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
              optional :scopes,
                       union: -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Scopes }

              # @!attribute universe_domain
              #   Google Cloud universe domain
              #
              #   @return [String, nil]
              optional :universe_domain, String, api_name: :universeDomain

              # @!method initialize(credentials:, project_id: nil, scopes: nil, universe_domain: nil, type: :googleServiceAccount)
              #   Vertex provider authentication configuration
              #
              #   @param credentials [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials] Google Cloud service account credentials
              #
              #   @param project_id [String] Google Cloud project ID used by google-auth-library
              #
              #   @param scopes [String, Array<String>] Google auth scopes for the desired API request
              #
              #   @param universe_domain [String] Google Cloud universe domain
              #
              #   @param type [Symbol, :googleServiceAccount] Use inline Google Cloud service account credentials for provider authentication

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth#credentials
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
                #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials::Type, nil]
                optional :type,
                         enum: -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials::Type }

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
                #   @param type [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials::Type]
                #   @param universe_domain [String]

                # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Credentials#type
                module Type
                  extend Stagehand::Internal::Type::Enum

                  SERVICE_ACCOUNT = :service_account

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Google auth scopes for the desired API request
              #
              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth#scopes
              module Scopes
                extend Stagehand::Internal::Type::Union

                variant String

                variant -> { Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::Auth::Scopes::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [Stagehand::Internal::Type::Converter]
                StringArray = Stagehand::Internal::Type::ArrayOf[String]
              end
            end

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute vertex
              #   Vertex AI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions::Vertex]
              required :vertex,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions::Vertex }

              # @!method initialize(vertex:)
              #   Vertex provider-specific model configuration
              #
              #   @param vertex [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions::Vertex] Vertex AI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject::ProviderOptions#vertex
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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::Auth]
            required :auth,
                     -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions
                     },
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
            #   @param auth [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::Auth] Azure provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject#auth
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

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject::ProviderOptions#azure
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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions
                     },
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
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject::ProviderOptions#azure
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
            #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject::Provider, nil]
            optional :provider,
                     enum: -> { Stagehand::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject::Provider }

            # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil)
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject::Provider] AI provider for the model (or provide a baseURL endpoint instead)

            # AI provider for the model (or provide a baseURL endpoint instead)
            #
            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject#provider
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
          #   @return [Array(Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::ExecutionModel::GenericModelConfigObject, String)]
        end

        # Tool mode for the agent (dom, hybrid, cua). If set, overrides cua.
        #
        # @see Stagehand::Models::SessionExecuteParams::AgentConfig#mode
        module Mode
          extend Stagehand::Internal::Type::Enum

          DOM = :dom
          HYBRID = :hybrid
          CUA = :cua

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        # @see Stagehand::Models::SessionExecuteParams::AgentConfig#model
        module Model
          extend Stagehand::Internal::Type::Union

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject }

          variant -> { Stagehand::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject }

          variant String

          class VertexModelConfigObject < Stagehand::Internal::Type::BaseModel
            # @!attribute auth
            #   Vertex provider authentication configuration
            #
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth]
            required :auth, -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions
                     },
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
            #   @param auth [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth] Vertex provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions] Vertex provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :vertex] Vertex AI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject#auth
            class Auth < Stagehand::Internal::Type::BaseModel
              # @!attribute credentials
              #   Google Cloud service account credentials
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials]
              required :credentials,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials }

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
              optional :scopes,
                       union: -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Scopes }

              # @!attribute universe_domain
              #   Google Cloud universe domain
              #
              #   @return [String, nil]
              optional :universe_domain, String, api_name: :universeDomain

              # @!method initialize(credentials:, project_id: nil, scopes: nil, universe_domain: nil, type: :googleServiceAccount)
              #   Vertex provider authentication configuration
              #
              #   @param credentials [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials] Google Cloud service account credentials
              #
              #   @param project_id [String] Google Cloud project ID used by google-auth-library
              #
              #   @param scopes [String, Array<String>] Google auth scopes for the desired API request
              #
              #   @param universe_domain [String] Google Cloud universe domain
              #
              #   @param type [Symbol, :googleServiceAccount] Use inline Google Cloud service account credentials for provider authentication

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth#credentials
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
                #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials::Type, nil]
                optional :type,
                         enum: -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials::Type }

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
                #   @param type [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials::Type]
                #   @param universe_domain [String]

                # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Credentials#type
                module Type
                  extend Stagehand::Internal::Type::Enum

                  SERVICE_ACCOUNT = :service_account

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Google auth scopes for the desired API request
              #
              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth#scopes
              module Scopes
                extend Stagehand::Internal::Type::Union

                variant String

                variant -> { Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::Auth::Scopes::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [Stagehand::Internal::Type::Converter]
                StringArray = Stagehand::Internal::Type::ArrayOf[String]
              end
            end

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute vertex
              #   Vertex AI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions::Vertex]
              required :vertex,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions::Vertex }

              # @!method initialize(vertex:)
              #   Vertex provider-specific model configuration
              #
              #   @param vertex [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions::Vertex] Vertex AI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject::ProviderOptions#vertex
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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::Auth]
            required :auth,
                     -> { Stagehand::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions
                     },
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
            #   @param auth [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::Auth] Azure provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject#auth
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

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject::ProviderOptions#azure
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
            #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions
                     },
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
            #   @param provider_options [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject::ProviderOptions#azure
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
            #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject::Provider, nil]
            optional :provider,
                     enum: -> { Stagehand::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject::Provider }

            # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil)
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject::Provider] AI provider for the model (or provide a baseURL endpoint instead)

            # AI provider for the model (or provide a baseURL endpoint instead)
            #
            # @see Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject#provider
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
          #   @return [Array(Stagehand::Models::SessionExecuteParams::AgentConfig::Model::VertexModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionExecuteParams::AgentConfig::Model::GenericModelConfigObject, String)]
        end

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        # @see Stagehand::Models::SessionExecuteParams::AgentConfig#provider
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

      class ExecuteOptions < Stagehand::Internal::Type::BaseModel
        # @!attribute instruction
        #   Natural language instruction for the agent
        #
        #   @return [String]
        required :instruction, String

        # @!attribute highlight_cursor
        #   Whether to visually highlight the cursor during execution
        #
        #   @return [Boolean, nil]
        optional :highlight_cursor, Stagehand::Internal::Type::Boolean, api_name: :highlightCursor

        # @!attribute max_steps
        #   Maximum number of steps the agent can take
        #
        #   @return [Float, nil]
        optional :max_steps, Float, api_name: :maxSteps

        # @!attribute tool_timeout
        #   Timeout in milliseconds for each agent tool call
        #
        #   @return [Float, nil]
        optional :tool_timeout, Float, api_name: :toolTimeout

        # @!attribute use_search
        #   Whether to enable the web search tool powered by Browserbase Search API
        #
        #   @return [Boolean, nil]
        optional :use_search, Stagehand::Internal::Type::Boolean, api_name: :useSearch

        # @!attribute variables
        #   Variables available to the agent via %variableName% syntax in supported tools
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3}, nil]
        optional :variables,
                 -> { Stagehand::Internal::Type::HashOf[union: Stagehand::SessionExecuteParams::ExecuteOptions::Variable] }

        # @!method initialize(instruction:, highlight_cursor: nil, max_steps: nil, tool_timeout: nil, use_search: nil, variables: nil)
        #   @param instruction [String] Natural language instruction for the agent
        #
        #   @param highlight_cursor [Boolean] Whether to visually highlight the cursor during execution
        #
        #   @param max_steps [Float] Maximum number of steps the agent can take
        #
        #   @param tool_timeout [Float] Timeout in milliseconds for each agent tool call
        #
        #   @param use_search [Boolean] Whether to enable the web search tool powered by Browserbase Search API
        #
        #   @param variables [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3}] Variables available to the agent via %variableName% syntax in supported tools

        module Variable
          extend Stagehand::Internal::Type::Union

          variant String

          variant Float

          variant Stagehand::Internal::Type::Boolean

          variant -> { Stagehand::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3 }

          class UnionMember3 < Stagehand::Internal::Type::BaseModel
            # @!attribute value
            #
            #   @return [String, Float, Boolean]
            required :value,
                     union: -> { Stagehand::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3::Value }

            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String

            # @!method initialize(value:, description: nil)
            #   @param value [String, Float, Boolean]
            #   @param description [String]

            # @see Stagehand::Models::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3#value
            module Value
              extend Stagehand::Internal::Type::Union

              variant String

              variant Float

              variant Stagehand::Internal::Type::Boolean

              # @!method self.variants
              #   @return [Array(String, Float, Boolean)]
            end
          end

          # @!method self.variants
          #   @return [Array(String, Float, Boolean, Stagehand::Models::SessionExecuteParams::ExecuteOptions::Variable::UnionMember3)]
        end
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
