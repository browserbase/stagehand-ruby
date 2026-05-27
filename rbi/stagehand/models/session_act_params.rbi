# typed: strong

module Stagehand
  module Models
    class SessionActParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionActParams, Stagehand::Internal::AnyHash)
        end

      # Unique session identifier
      sig { returns(String) }
      attr_accessor :id

      # Natural language instruction or Action object
      sig { returns(T.any(String, Stagehand::Action)) }
      attr_accessor :input

      # Target frame ID for the action
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      sig { returns(T.nilable(Stagehand::SessionActParams::Options)) }
      attr_reader :options

      sig { params(options: Stagehand::SessionActParams::Options::OrHash).void }
      attr_writer :options

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(Stagehand::SessionActParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          id: String,
          input: T.any(String, Stagehand::Action::OrHash),
          frame_id: T.nilable(String),
          options: Stagehand::SessionActParams::Options::OrHash,
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique session identifier
        id:,
        # Natural language instruction or Action object
        input:,
        # Target frame ID for the action
        frame_id: nil,
        options: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            input: T.any(String, Stagehand::Action),
            frame_id: T.nilable(String),
            options: Stagehand::SessionActParams::Options,
            x_stream_response:
              Stagehand::SessionActParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Natural language instruction or Action object
      module Input
        extend Stagehand::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Stagehand::Action) }

        sig do
          override.returns(
            T::Array[Stagehand::SessionActParams::Input::Variants]
          )
        end
        def self.variants
        end
      end

      class Options < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionActParams::Options,
              Stagehand::Internal::AnyHash
            )
          end

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        sig do
          returns(
            T.nilable(
              T.any(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject,
                Stagehand::SessionActParams::Options::Model::GenericModelConfigObject,
                String
              )
            )
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::OrHash,
                Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::OrHash,
                String
              )
          ).void
        end
        attr_writer :model

        # Timeout in ms for the action
        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        # Variables to substitute in the action instruction. Accepts flat primitives or {
        # value, description? } objects.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                T.any(
                  String,
                  Float,
                  T::Boolean,
                  Stagehand::SessionActParams::Options::Variable::UnionMember3
                )
              ]
            )
          )
        end
        attr_reader :variables

        sig do
          params(
            variables:
              T::Hash[
                Symbol,
                T.any(
                  String,
                  Float,
                  T::Boolean,
                  Stagehand::SessionActParams::Options::Variable::UnionMember3::OrHash
                )
              ]
          ).void
        end
        attr_writer :variables

        sig do
          params(
            model:
              T.any(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::OrHash,
                Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::OrHash,
                String
              ),
            timeout: Float,
            variables:
              T::Hash[
                Symbol,
                T.any(
                  String,
                  Float,
                  T::Boolean,
                  Stagehand::SessionActParams::Options::Variable::UnionMember3::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
          model: nil,
          # Timeout in ms for the action
          timeout: nil,
          # Variables to substitute in the action instruction. Accepts flat primitives or {
          # value, description? } objects.
          variables: nil
        )
        end

        sig do
          override.returns(
            {
              model:
                T.any(
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject,
                  String
                ),
              timeout: Float,
              variables:
                T::Hash[
                  Symbol,
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    Stagehand::SessionActParams::Options::Variable::UnionMember3
                  )
                ]
            }
          )
        end
        def to_hash
        end

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        module Model
          extend Stagehand::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject,
                Stagehand::SessionActParams::Options::Model::GenericModelConfigObject,
                String
              )
            end

          class VertexModelConfigObject < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject,
                  Stagehand::Internal::AnyHash
                )
              end

            # Vertex provider authentication configuration
            sig do
              returns(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth
              )
            end
            attr_reader :auth

            sig do
              params(
                auth:
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::OrHash
              ).void
            end
            attr_writer :auth

            # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
            sig { returns(String) }
            attr_accessor :model_name

            # Vertex AI model provider
            sig { returns(Symbol) }
            attr_accessor :provider

            # Vertex provider-specific model configuration
            sig do
              returns(
                Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions
              )
            end
            attr_reader :provider_options

            sig do
              params(
                provider_options:
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::OrHash
              ).void
            end
            attr_writer :provider_options

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

            # Custom headers sent with every request to the model provider
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :headers

            sig { params(headers: T::Hash[Symbol, String]).void }
            attr_writer :headers

            sig do
              params(
                auth:
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::OrHash,
                model_name: String,
                provider_options:
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::OrHash,
                api_key: String,
                base_url: String,
                headers: T::Hash[Symbol, String],
                provider: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Vertex provider authentication configuration
              auth:,
              # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
              model_name:,
              # Vertex provider-specific model configuration
              provider_options:,
              # API key for the model provider
              api_key: nil,
              # Base URL for the model provider
              base_url: nil,
              # Custom headers sent with every request to the model provider
              headers: nil,
              # Vertex AI model provider
              provider: :vertex
            )
            end

            sig do
              override.returns(
                {
                  auth:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth,
                  model_name: String,
                  provider: Symbol,
                  provider_options:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions,
                  api_key: String,
                  base_url: String,
                  headers: T::Hash[Symbol, String]
                }
              )
            end
            def to_hash
            end

            class Auth < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth,
                    Stagehand::Internal::AnyHash
                  )
                end

              # Google Cloud service account credentials
              sig do
                returns(
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials
                )
              end
              attr_reader :credentials

              sig do
                params(
                  credentials:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::OrHash
                ).void
              end
              attr_writer :credentials

              # Use inline Google Cloud service account credentials for provider authentication
              sig { returns(Symbol) }
              attr_accessor :type

              # Google Cloud project ID used by google-auth-library
              sig { returns(T.nilable(String)) }
              attr_reader :project_id

              sig { params(project_id: String).void }
              attr_writer :project_id

              # Google auth scopes for the desired API request
              sig do
                returns(
                  T.nilable(
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::Variants
                  )
                )
              end
              attr_reader :scopes

              sig do
                params(
                  scopes:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::Variants
                ).void
              end
              attr_writer :scopes

              # Google Cloud universe domain
              sig { returns(T.nilable(String)) }
              attr_reader :universe_domain

              sig { params(universe_domain: String).void }
              attr_writer :universe_domain

              # Vertex provider authentication configuration
              sig do
                params(
                  credentials:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::OrHash,
                  project_id: String,
                  scopes:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::Variants,
                  universe_domain: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Google Cloud service account credentials
                credentials:,
                # Google Cloud project ID used by google-auth-library
                project_id: nil,
                # Google auth scopes for the desired API request
                scopes: nil,
                # Google Cloud universe domain
                universe_domain: nil,
                # Use inline Google Cloud service account credentials for provider authentication
                type: :googleServiceAccount
              )
              end

              sig do
                override.returns(
                  {
                    credentials:
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials,
                    type: Symbol,
                    project_id: String,
                    scopes:
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::Variants,
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
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials,
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
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::OrSymbol
                    )
                  )
                end
                attr_reader :type

                sig do
                  params(
                    type:
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::OrSymbol
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
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::OrSymbol,
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
                        Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::OrSymbol,
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
                        Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  SERVICE_ACCOUNT =
                    T.let(
                      :service_account,
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Credentials::Type::TaggedSymbol
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
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::Auth::Scopes::Variants
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

            class ProviderOptions < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions,
                    Stagehand::Internal::AnyHash
                  )
                end

              # Vertex AI provider-specific settings
              sig do
                returns(
                  Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex
                )
              end
              attr_reader :vertex

              sig do
                params(
                  vertex:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex::OrHash
                ).void
              end
              attr_writer :vertex

              # Vertex provider-specific model configuration
              sig do
                params(
                  vertex:
                    Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Vertex AI provider-specific settings
                vertex:
              )
              end

              sig do
                override.returns(
                  {
                    vertex:
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex
                  }
                )
              end
              def to_hash
              end

              class Vertex < Stagehand::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Stagehand::SessionActParams::Options::Model::VertexModelConfigObject::ProviderOptions::Vertex,
                      Stagehand::Internal::AnyHash
                    )
                  end

                # Google Cloud location for Vertex AI models
                sig { returns(String) }
                attr_accessor :location

                # Google Cloud project ID for Vertex AI models
                sig { returns(String) }
                attr_accessor :project

                # Base URL for the Vertex AI provider
                sig { returns(T.nilable(String)) }
                attr_reader :base_url

                sig { params(base_url: String).void }
                attr_writer :base_url

                # Custom headers sent with every request to the Vertex AI provider
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :headers

                sig { params(headers: T::Hash[Symbol, String]).void }
                attr_writer :headers

                # Vertex AI provider-specific settings
                sig do
                  params(
                    location: String,
                    project: String,
                    base_url: String,
                    headers: T::Hash[Symbol, String]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Google Cloud location for Vertex AI models
                  location:,
                  # Google Cloud project ID for Vertex AI models
                  project:,
                  # Base URL for the Vertex AI provider
                  base_url: nil,
                  # Custom headers sent with every request to the Vertex AI provider
                  headers: nil
                )
                end

                sig do
                  override.returns(
                    {
                      location: String,
                      project: String,
                      base_url: String,
                      headers: T::Hash[Symbol, String]
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class GenericModelConfigObject < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject,
                  Stagehand::Internal::AnyHash
                )
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

            # Custom headers sent with every request to the model provider
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :headers

            sig { params(headers: T::Hash[Symbol, String]).void }
            attr_writer :headers

            # AI provider for the model (or provide a baseURL endpoint instead)
            sig do
              returns(
                T.nilable(
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::OrSymbol
                )
              )
            end
            attr_reader :provider

            sig do
              params(
                provider:
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::OrSymbol
              ).void
            end
            attr_writer :provider

            sig do
              params(
                model_name: String,
                api_key: String,
                base_url: String,
                headers: T::Hash[Symbol, String],
                provider:
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
              model_name:,
              # API key for the model provider
              api_key: nil,
              # Base URL for the model provider
              base_url: nil,
              # Custom headers sent with every request to the model provider
              headers: nil,
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
                  headers: T::Hash[Symbol, String],
                  provider:
                    Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::OrSymbol
                }
              )
            end
            def to_hash
            end

            # AI provider for the model (or provide a baseURL endpoint instead)
            module Provider
              extend Stagehand::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OPENAI =
                T.let(
                  :openai,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                )
              ANTHROPIC =
                T.let(
                  :anthropic,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                )
              GOOGLE =
                T.let(
                  :google,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                )
              MICROSOFT =
                T.let(
                  :microsoft,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                )
              BEDROCK =
                T.let(
                  :bedrock,
                  Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionActParams::Options::Model::GenericModelConfigObject::Provider::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[Stagehand::SessionActParams::Options::Model::Variants]
            )
          end
          def self.variants
          end
        end

        module Variable
          extend Stagehand::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Float,
                T::Boolean,
                Stagehand::SessionActParams::Options::Variable::UnionMember3
              )
            end

          class UnionMember3 < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::SessionActParams::Options::Variable::UnionMember3,
                  Stagehand::Internal::AnyHash
                )
              end

            sig do
              returns(
                Stagehand::SessionActParams::Options::Variable::UnionMember3::Value::Variants
              )
            end
            attr_accessor :value

            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            sig do
              params(
                value:
                  Stagehand::SessionActParams::Options::Variable::UnionMember3::Value::Variants,
                description: String
              ).returns(T.attached_class)
            end
            def self.new(value:, description: nil)
            end

            sig do
              override.returns(
                {
                  value:
                    Stagehand::SessionActParams::Options::Variable::UnionMember3::Value::Variants,
                  description: String
                }
              )
            end
            def to_hash
            end

            module Value
              extend Stagehand::Internal::Type::Union

              Variants = T.type_alias { T.any(String, Float, T::Boolean) }

              sig do
                override.returns(
                  T::Array[
                    Stagehand::SessionActParams::Options::Variable::UnionMember3::Value::Variants
                  ]
                )
              end
              def self.variants
              end
            end
          end

          sig do
            override.returns(
              T::Array[Stagehand::SessionActParams::Options::Variable::Variants]
            )
          end
          def self.variants
          end
        end
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionActParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionActParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionActParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionActParams::XStreamResponse::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
