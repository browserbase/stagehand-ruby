# frozen_string_literal: true

module StagehandSDK
  module Models
    class StreamEvent < StagehandSDK::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for this event
      #
      #   @return [String]
      required :id, String

      # @!attribute data
      #
      #   @return [StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput, StagehandSDK::Models::StreamEvent::Data::StreamEventLogDataOutput]
      required :data, union: -> { StagehandSDK::StreamEvent::Data }

      # @!attribute type
      #   Type of stream event - system events or log messages
      #
      #   @return [Symbol, StagehandSDK::Models::StreamEvent::Type]
      required :type, enum: -> { StagehandSDK::StreamEvent::Type }

      # @!method initialize(id:, data:, type:)
      #   Server-Sent Event emitted during streaming responses. Events are sent as
      #   `data: <JSON>\n\n`. Key order: data (with status first), type, id.
      #
      #   @param id [String] Unique identifier for this event
      #
      #   @param data [StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput, StagehandSDK::Models::StreamEvent::Data::StreamEventLogDataOutput]
      #
      #   @param type [Symbol, StagehandSDK::Models::StreamEvent::Type] Type of stream event - system events or log messages

      # @see StagehandSDK::Models::StreamEvent#data
      module Data
        extend StagehandSDK::Internal::Type::Union

        variant -> { StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput }

        variant -> { StagehandSDK::StreamEvent::Data::StreamEventLogDataOutput }

        class StreamEventSystemDataOutput < StagehandSDK::Internal::Type::BaseModel
          # @!attribute status
          #   Current status of the streaming operation
          #
          #   @return [Symbol, StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput::Status]
          required :status, enum: -> { StagehandSDK::StreamEvent::Data::StreamEventSystemDataOutput::Status }

          # @!attribute error
          #   Error message (present when status is 'error')
          #
          #   @return [String, nil]
          optional :error, String

          # @!attribute result
          #   Operation result (present when status is 'finished')
          #
          #   @return [Object, nil]
          optional :result, StagehandSDK::Internal::Type::Unknown

          # @!method initialize(status:, error: nil, result: nil)
          #   @param status [Symbol, StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput::Status] Current status of the streaming operation
          #
          #   @param error [String] Error message (present when status is 'error')
          #
          #   @param result [Object] Operation result (present when status is 'finished')

          # Current status of the streaming operation
          #
          # @see StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput#status
          module Status
            extend StagehandSDK::Internal::Type::Enum

            STARTING = :starting
            CONNECTED = :connected
            RUNNING = :running
            FINISHED = :finished
            ERROR = :error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class StreamEventLogDataOutput < StagehandSDK::Internal::Type::BaseModel
          # @!attribute message
          #   Log message from the operation
          #
          #   @return [String]
          required :message, String

          # @!attribute status
          #
          #   @return [Symbol, :running]
          required :status, const: :running

          # @!method initialize(message:, status: :running)
          #   @param message [String] Log message from the operation
          #
          #   @param status [Symbol, :running]
        end

        # @!method self.variants
        #   @return [Array(StagehandSDK::Models::StreamEvent::Data::StreamEventSystemDataOutput, StagehandSDK::Models::StreamEvent::Data::StreamEventLogDataOutput)]
      end

      # Type of stream event - system events or log messages
      #
      # @see StagehandSDK::Models::StreamEvent#type
      module Type
        extend StagehandSDK::Internal::Type::Enum

        SYSTEM = :system
        LOG = :log

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
