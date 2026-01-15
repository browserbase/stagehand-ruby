# typed: strong

module StagehandSDK
  module Models
    class StreamEvent < StagehandSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(StagehandSDK::StreamEvent, StagehandSDK::Internal::AnyHash)
        end

      # Unique identifier for this event
      sig { returns(String) }
      attr_accessor :id

      sig { returns(StagehandSDK::StreamEvent::Data::Variants) }
      attr_accessor :data

      # Type of stream event - system events or log messages
      sig { returns(StagehandSDK::StreamEvent::Type::TaggedSymbol) }
      attr_accessor :type

      # Server-Sent Event emitted during streaming responses. Events are sent as
      # `data: <JSON>\n\n`. Key order: data (with status first), type, id.
      sig do
        params(
          id: String,
          data:
            T.any(
              StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::OrHash,
              StagehandSDK::StreamEvent::Data::StreamEventLogDataOutput::OrHash
            ),
          type: StagehandSDK::StreamEvent::Type::OrSymbol
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
            data: StagehandSDK::StreamEvent::Data::Variants,
            type: StagehandSDK::StreamEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Data
        extend StagehandSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput,
              StagehandSDK::StreamEvent::Data::StreamEventLogDataOutput
            )
          end

        class StreamEventSystemDataOutput < StagehandSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput,
                StagehandSDK::Internal::AnyHash
              )
            end

          # Current status of the streaming operation
          sig do
            returns(
              StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
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
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::OrSymbol,
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
                  StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol,
                error: String,
                result: T.anything
              }
            )
          end
          def to_hash
          end

          # Current status of the streaming operation
          module Status
            extend StagehandSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            STARTING =
              T.let(
                :starting,
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            CONNECTED =
              T.let(
                :connected,
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            RUNNING =
              T.let(
                :running,
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            FINISHED =
              T.let(
                :finished,
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )
            ERROR =
              T.let(
                :error,
                StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class StreamEventLogDataOutput < StagehandSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                StagehandSDK::StreamEvent::Data::StreamEventLogDataOutput,
                StagehandSDK::Internal::AnyHash
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
          override.returns(T::Array[StagehandSDK::StreamEvent::Data::Variants])
        end
        def self.variants
        end
      end

      # Type of stream event - system events or log messages
      module Type
        extend StagehandSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, StagehandSDK::StreamEvent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SYSTEM = T.let(:system, StagehandSDK::StreamEvent::Type::TaggedSymbol)
        LOG = T.let(:log, StagehandSDK::StreamEvent::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[StagehandSDK::StreamEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
