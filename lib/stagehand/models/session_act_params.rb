# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#act
    #
    # @see Stagehand::Resources::Sessions#act_streaming
    class SessionActParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute id
      #   Unique session identifier
      #
      #   @return [String]
      required :id, String

      # @!attribute input
      #   Natural language instruction or Action object
      #
      #   @return [String, Stagehand::Models::Action]
      required :input, union: -> { Stagehand::SessionActParams::Input }

      # @!attribute frame_id
      #   Target frame ID for the action
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionActParams::Options, nil]
      optional :options, -> { Stagehand::SessionActParams::Options }

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionActParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionActParams::XStreamResponse }

      # @!method initialize(id:, input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param id [String] Unique session identifier
      #
      #   @param input [String, Stagehand::Models::Action] Natural language instruction or Action object
      #
      #   @param frame_id [String, nil] Target frame ID for the action
      #
      #   @param options [Stagehand::Models::SessionActParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionActParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      # Natural language instruction or Action object
      module Input
        extend Stagehand::Internal::Type::Union

        variant String

        # Action object returned by observe and used by act
        variant -> { Stagehand::Action }

        # @!method self.variants
        #   @return [Array(String, Stagehand::Models::Action)]
      end

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #   Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @return [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject, String, nil]
        optional :model, union: -> { Stagehand::SessionActParams::Options::Model }

        # @!attribute timeout
        #   Timeout in ms for the action
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute variables
        #   Variables to substitute in the action instruction. Accepts flat primitives or {
        #   value, description? } objects.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionActParams::Options::Variable::UnionMember3}, nil]
        optional :variables,
                 -> { Stagehand::Internal::Type::HashOf[union: Stagehand::SessionActParams::Options::Variable] }

        # @!method initialize(model: nil, timeout: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionActParams::Options} for more details.
        #
        #   @param model [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject, String] Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @param timeout [Float] Timeout in ms for the action
        #
        #   @param variables [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionActParams::Options::Variable::UnionMember3}] Variables to substitute in the action instruction. Accepts flat primitives or {

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        # @see Stagehand::Models::SessionActParams::Options#model
        module Model
          extend Stagehand::Internal::Type::Union

          variant -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject }

          variant -> { Stagehand::SessionActParams::Options::Model::AzureEntraModelConfigObject }

          variant -> { Stagehand::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject }

          variant -> { Stagehand::SessionActParams::Options::Model::GenericModelConfigObject }

          variant String

          class VertexModelConfigObject < Stagehand::Internal::Type::BaseModel
            # @!attribute auth
            #   Vertex provider authentication configuration
            #
            #   @return [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth]
            required :auth, -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions
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
            #   @param auth [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth] Vertex provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions] Vertex provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :vertex] Vertex AI model provider

            # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject#auth
            class Auth < Stagehand::Internal::Type::BaseModel
              # @!attribute credentials
              #   Google Cloud service account credentials
              #
              #   @return [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials]
              required :credentials,
                       -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials }

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
                       union: -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes }

              # @!attribute universe_domain
              #   Google Cloud universe domain
              #
              #   @return [String, nil]
              optional :universe_domain, String, api_name: :universeDomain

              # @!method initialize(credentials:, project_id: nil, scopes: nil, universe_domain: nil, type: :googleServiceAccount)
              #   Vertex provider authentication configuration
              #
              #   @param credentials [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials] Google Cloud service account credentials
              #
              #   @param project_id [String] Google Cloud project ID used by google-auth-library
              #
              #   @param scopes [String, Array<String>] Google auth scopes for the desired API request
              #
              #   @param universe_domain [String] Google Cloud universe domain
              #
              #   @param type [Symbol, :googleServiceAccount] Use inline Google Cloud service account credentials for provider authentication

              # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth#credentials
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
                #   @return [Symbol, Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type, nil]
                optional :type,
                         enum: -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type }

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
                #   @param type [Symbol, Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type]
                #   @param universe_domain [String]

                # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials#type
                module Type
                  extend Stagehand::Internal::Type::Enum

                  SERVICE_ACCOUNT = :service_account

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Google auth scopes for the desired API request
              #
              # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth#scopes
              module Scopes
                extend Stagehand::Internal::Type::Union

                variant String

                variant -> { Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [Stagehand::Internal::Type::Converter]
                StringArray = Stagehand::Internal::Type::ArrayOf[String]
              end
            end

            # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute vertex
              #   Vertex AI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex]
              required :vertex,
                       -> { Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex }

              # @!method initialize(vertex:)
              #   Vertex provider-specific model configuration
              #
              #   @param vertex [Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex] Vertex AI provider-specific settings

              # @see Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions#vertex
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
            #   @return [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::Auth]
            required :auth, -> { Stagehand::SessionActParams::Options::Model::AzureEntraModelConfigObject::Auth }

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
            #   @return [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions
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
            #   @param auth [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::Auth] Azure provider authentication configuration
            #
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param provider_options [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject#auth
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

            # @see Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject::ProviderOptions#azure
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
            #   @return [Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions]
            required :provider_options,
                     -> {
                       Stagehand::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions
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
            #   @param provider_options [Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions] Azure provider-specific model configuration
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, :azure] Azure OpenAI model provider

            # @see Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject#provider_options
            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              # @!attribute azure
              #   Azure OpenAI provider-specific settings
              #
              #   @return [Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure]
              required :azure,
                       -> { Stagehand::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure }

              # @!method initialize(azure:)
              #   Azure provider-specific model configuration
              #
              #   @param azure [Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions::Azure] Azure OpenAI provider-specific settings

              # @see Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject::ProviderOptions#azure
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
            #   @return [Symbol, Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject::Provider, nil]
            optional :provider,
                     enum: -> { Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider }

            # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil)
            #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            #
            #   @param api_key [String] API key for the model provider
            #
            #   @param base_url [String] Base URL for the model provider
            #
            #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
            #
            #   @param provider [Symbol, Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject::Provider] AI provider for the model (or provide a baseURL endpoint instead)

            # AI provider for the model (or provide a baseURL endpoint instead)
            #
            # @see Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject#provider
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
          #   @return [Array(Stagehand::Models::SessionActParams::Options::Model::VertexModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureEntraModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::AzureAPIKeyModelConfigObject, Stagehand::Models::SessionActParams::Options::Model::GenericModelConfigObject, String)]
        end

        module Variable
          extend Stagehand::Internal::Type::Union

          variant String

          variant Float

          variant Stagehand::Internal::Type::Boolean

          variant -> { Stagehand::SessionActParams::Options::Variable::UnionMember3 }

          class UnionMember3 < Stagehand::Internal::Type::BaseModel
            # @!attribute value
            #
            #   @return [String, Float, Boolean]
            required :value, union: -> { Stagehand::SessionActParams::Options::Variable::UnionMember3::Value }

            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String

            # @!method initialize(value:, description: nil)
            #   @param value [String, Float, Boolean]
            #   @param description [String]

            # @see Stagehand::Models::SessionActParams::Options::Variable::UnionMember3#value
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
          #   @return [Array(String, Float, Boolean, Stagehand::Models::SessionActParams::Options::Variable::UnionMember3)]
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
