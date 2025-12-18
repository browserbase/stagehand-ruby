# typed: strong

module Stagehand
  module Models
    class StreamEvent < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Stagehand::StreamEvent, Stagehand::Internal::AnyHash)
        end

      # Unique identifier for this event
      sig { returns(String) }
      attr_accessor :id

      sig { returns(Stagehand::StreamEvent::Data::Variants) }
      attr_accessor :data

      # Type of stream event - system events or log messages
      sig { returns(Stagehand::StreamEvent::Type::TaggedSymbol) }
      attr_accessor :type

      # Server-Sent Event emitted during streaming responses. Events are sent as
      # `data: <JSON>\n\n`.
      sig do
        params(
          id: String,
          data:
            T.any(
              Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::OrHash,
              Stagehand::StreamEvent::Data::StreamEventLogDataOutput::OrHash
            ),
          type: Stagehand::StreamEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for this event
        id:,
        data:,
        # Type of stream event - system events or log messages
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: Stagehand::StreamEvent::Data::Variants,
            type: Stagehand::StreamEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Data
        extend Stagehand::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Stagehand::StreamEvent::Data::StreamEventSystemDataOutput,
              Stagehand::StreamEvent::Data::StreamEventLogDataOutput
            )
          end

        class StreamEventSystemDataOutput < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput,
                Stagehand::Internal::AnyHash
              )
            end

          # Current status of the streaming operation
          sig do
            returns(
              Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # Error message (present when status is 'error')
          sig { returns(T.nilable(String)) }
          attr_reader :error

          sig { params(error: String).void }
          attr_writer :error

          # Operation result (present when status is 'finished')
          sig { returns(T.nilable(T.anything)) }
          attr_reader :result

          sig { params(result: T.anything).void }
          attr_writer :result

          sig do
            params(
              status:
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::OrSymbol,
              error: String,
              result: T.anything
            ).returns(T.attached_class)
          end
          def self.new(
            # Current status of the streaming operation
            status:,
            # Error message (present when status is 'error')
            error: nil,
            # Operation result (present when status is 'finished')
            result: nil
          )
          end

          sig do
            override.returns(
              {
                status:
                  Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol,
                error: String,
                result: T.anything
              }
            )
          end
          def to_hash
          end

          # Current status of the streaming operation
          module Status
            extend Stagehand::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            STARTING =
              T.let(
                :starting,
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            CONNECTED =
              T.let(
                :connected,
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            RUNNING =
              T.let(
                :running,
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            FINISHED =
              T.let(
                :finished,
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            ERROR =
              T.let(
                :error,
                Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class StreamEventLogDataOutput < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::StreamEvent::Data::StreamEventLogDataOutput,
                Stagehand::Internal::AnyHash
              )
            end

          # Log message from the operation
          sig { returns(String) }
          attr_accessor :message

          sig { returns(Symbol) }
          attr_accessor :status

          sig do
            params(message: String, status: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Log message from the operation
            message:,
            status: :running
          )
          end

          sig { override.returns({ message: String, status: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(T::Array[Stagehand::StreamEvent::Data::Variants])
        end
        def self.variants
        end
      end

      # Type of stream event - system events or log messages
      module Type
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::StreamEvent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SYSTEM = T.let(:system, Stagehand::StreamEvent::Type::TaggedSymbol)
        LOG = T.let(:log, Stagehand::StreamEvent::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Stagehand::StreamEvent::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
