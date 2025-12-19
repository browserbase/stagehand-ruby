# typed: strong

module Stagehand
  module Models
    class SessionActResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionActResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::Models::SessionActResponse::Data) }
      attr_reader :data

      sig do
        params(data: Stagehand::Models::SessionActResponse::Data::OrHash).void
      end
      attr_writer :data

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionActResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Indicates whether the request was successful
        success:
      )
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionActResponse::Data,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionActResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(Stagehand::Models::SessionActResponse::Data::Result) }
        attr_reader :result

        sig do
          params(
            result: Stagehand::Models::SessionActResponse::Data::Result::OrHash
          ).void
        end
        attr_writer :result

        # Action ID for tracking
        sig { returns(T.nilable(String)) }
        attr_reader :action_id

        sig { params(action_id: String).void }
        attr_writer :action_id

        sig do
          params(
            result: Stagehand::Models::SessionActResponse::Data::Result::OrHash,
            action_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          result:,
          # Action ID for tracking
          action_id: nil
        )
        end

        sig do
          override.returns(
            {
              result: Stagehand::Models::SessionActResponse::Data::Result,
              action_id: String
            }
          )
        end
        def to_hash
        end

        class Result < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::Models::SessionActResponse::Data::Result,
                Stagehand::Internal::AnyHash
              )
            end

          # Description of the action that was performed
          sig { returns(String) }
          attr_accessor :action_description

          # List of actions that were executed
          sig do
            returns(
              T::Array[
                Stagehand::Models::SessionActResponse::Data::Result::Action
              ]
            )
          end
          attr_accessor :actions

          # Human-readable result message
          sig { returns(String) }
          attr_accessor :message

          # Whether the action completed successfully
          sig { returns(T::Boolean) }
          attr_accessor :success

          sig do
            params(
              action_description: String,
              actions:
                T::Array[
                  Stagehand::Models::SessionActResponse::Data::Result::Action::OrHash
                ],
              message: String,
              success: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Description of the action that was performed
            action_description:,
            # List of actions that were executed
            actions:,
            # Human-readable result message
            message:,
            # Whether the action completed successfully
            success:
          )
          end

          sig do
            override.returns(
              {
                action_description: String,
                actions:
                  T::Array[
                    Stagehand::Models::SessionActResponse::Data::Result::Action
                  ],
                message: String,
                success: T::Boolean
              }
            )
          end
          def to_hash
          end

          class Action < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::Models::SessionActResponse::Data::Result::Action,
                  Stagehand::Internal::AnyHash
                )
              end

            # Human-readable description of the action
            sig { returns(String) }
            attr_accessor :description

            # CSS selector or XPath for the element
            sig { returns(String) }
            attr_accessor :selector

            # Arguments to pass to the method
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :arguments

            sig { params(arguments: T::Array[String]).void }
            attr_writer :arguments

            # Backend node ID for the element
            sig { returns(T.nilable(Float)) }
            attr_reader :backend_node_id

            sig { params(backend_node_id: Float).void }
            attr_writer :backend_node_id

            # The method to execute (click, fill, etc.)
            sig { returns(T.nilable(String)) }
            attr_reader :method_

            sig { params(method_: String).void }
            attr_writer :method_

            # Action object returned by observe and used by act
            sig do
              params(
                description: String,
                selector: String,
                arguments: T::Array[String],
                backend_node_id: Float,
                method_: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Human-readable description of the action
              description:,
              # CSS selector or XPath for the element
              selector:,
              # Arguments to pass to the method
              arguments: nil,
              # Backend node ID for the element
              backend_node_id: nil,
              # The method to execute (click, fill, etc.)
              method_: nil
            )
            end

            sig do
              override.returns(
                {
                  description: String,
                  selector: String,
                  arguments: T::Array[String],
                  backend_node_id: Float,
                  method_: String
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
