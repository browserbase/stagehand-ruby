# frozen_string_literal: true

module Stagehand
  module Models
    class StreamEvent < Stagehand::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for this event
      #
      #   @return [String]
      required :id, String

      # @!attribute data
      #
      #   @return [Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput, Stagehand::Models::StreamEvent::Data::StreamEventLogDataOutput]
      required :data, union: -> { Stagehand::StreamEvent::Data }

      # @!attribute type
      #   Type of stream event - system events or log messages
      #
      #   @return [Symbol, Stagehand::Models::StreamEvent::Type]
      required :type, enum: -> { Stagehand::StreamEvent::Type }

      # @!method initialize(id:, data:, type:)
      #   Server-Sent Event emitted during streaming responses. Events are sent as
      #   `data: <JSON>\n\n`. Key order: data (with status first), type, id.
      #
      #   @param id [String] Unique identifier for this event
      #
      #   @param data [Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput, Stagehand::Models::StreamEvent::Data::StreamEventLogDataOutput]
      #
      #   @param type [Symbol, Stagehand::Models::StreamEvent::Type] Type of stream event - system events or log messages

      # @see Stagehand::Models::StreamEvent#data
      module Data
        extend Stagehand::Internal::Type::Union

        variant -> { Stagehand::StreamEvent::Data::StreamEventSystemDataOutput }

        variant -> { Stagehand::StreamEvent::Data::StreamEventLogDataOutput }

        class StreamEventSystemDataOutput < Stagehand::Internal::Type::BaseModel
          # @!attribute status
          #   Current status of the streaming operation
          #
          #   @return [Symbol, Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput::Status]
          required :status, enum: -> { Stagehand::StreamEvent::Data::StreamEventSystemDataOutput::Status }

          # @!attribute error
          #   Error message (present when status is 'error')
          #
          #   @return [String, nil]
          optional :error, String

          # @!attribute result
          #   Operation result (present when status is 'finished')
          #
          #   @return [Object, nil]
          optional :result, Stagehand::Internal::Type::Unknown

          # @!method initialize(status:, error: nil, result: nil)
          #   @param status [Symbol, Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput::Status] Current status of the streaming operation
          #
          #   @param error [String] Error message (present when status is 'error')
          #
          #   @param result [Object] Operation result (present when status is 'finished')

          # Current status of the streaming operation
          #
          # @see Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput#status
          module Status
            extend Stagehand::Internal::Type::Enum

            STARTING = :starting
            CONNECTED = :connected
            RUNNING = :running
            FINISHED = :finished
            ERROR = :error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class StreamEventLogDataOutput < Stagehand::Internal::Type::BaseModel
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
        #   @return [Array(Stagehand::Models::StreamEvent::Data::StreamEventSystemDataOutput, Stagehand::Models::StreamEvent::Data::StreamEventLogDataOutput)]
      end

      # Type of stream event - system events or log messages
      #
      # @see Stagehand::Models::StreamEvent#type
      module Type
        extend Stagehand::Internal::Type::Enum

        SYSTEM = :system
        LOG = :log

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
