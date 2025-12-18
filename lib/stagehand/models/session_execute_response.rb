# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#execute
    #
    # @see Stagehand::Resources::Sessions#execute_streaming
    class SessionExecuteResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionExecuteResponse::Data]
      required :data, -> { Stagehand::Models::SessionExecuteResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionExecuteResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Stagehand::Models::SessionExecuteResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute result
        #
        #   @return [Stagehand::Models::SessionExecuteResponse::Data::Result]
        required :result, -> { Stagehand::Models::SessionExecuteResponse::Data::Result }

        # @!method initialize(result:)
        #   @param result [Stagehand::Models::SessionExecuteResponse::Data::Result]

        # @see Stagehand::Models::SessionExecuteResponse::Data#result
        class Result < Stagehand::Internal::Type::BaseModel
          # @!attribute actions
          #
          #   @return [Array<Stagehand::Models::SessionExecuteResponse::Data::Result::Action>]
          required :actions,
                   -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionExecuteResponse::Data::Result::Action] }

          # @!attribute completed
          #   Whether the agent finished its task
          #
          #   @return [Boolean]
          required :completed, Stagehand::Internal::Type::Boolean

          # @!attribute message
          #   Summary of what the agent accomplished
          #
          #   @return [String]
          required :message, String

          # @!attribute success
          #   Whether the agent completed successfully
          #
          #   @return [Boolean]
          required :success, Stagehand::Internal::Type::Boolean

          # @!attribute metadata
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :metadata, Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]

          # @!attribute usage
          #
          #   @return [Stagehand::Models::SessionExecuteResponse::Data::Result::Usage, nil]
          optional :usage, -> { Stagehand::Models::SessionExecuteResponse::Data::Result::Usage }

          # @!method initialize(actions:, completed:, message:, success:, metadata: nil, usage: nil)
          #   @param actions [Array<Stagehand::Models::SessionExecuteResponse::Data::Result::Action>]
          #
          #   @param completed [Boolean] Whether the agent finished its task
          #
          #   @param message [String] Summary of what the agent accomplished
          #
          #   @param success [Boolean] Whether the agent completed successfully
          #
          #   @param metadata [Hash{Symbol=>Object}]
          #
          #   @param usage [Stagehand::Models::SessionExecuteResponse::Data::Result::Usage]

          class Action < Stagehand::Internal::Type::BaseModel
            # @!attribute type
            #   Type of action taken
            #
            #   @return [String]
            required :type, String

            # @!attribute action
            #
            #   @return [String, nil]
            optional :action, String

            # @!attribute instruction
            #
            #   @return [String, nil]
            optional :instruction, String

            # @!attribute page_text
            #
            #   @return [String, nil]
            optional :page_text, String, api_name: :pageText

            # @!attribute page_url
            #
            #   @return [String, nil]
            optional :page_url, String, api_name: :pageUrl

            # @!attribute reasoning
            #   Agent's reasoning for taking this action
            #
            #   @return [String, nil]
            optional :reasoning, String

            # @!attribute task_completed
            #
            #   @return [Boolean, nil]
            optional :task_completed, Stagehand::Internal::Type::Boolean, api_name: :taskCompleted

            # @!attribute time_ms
            #   Time taken for this action in ms
            #
            #   @return [Float, nil]
            optional :time_ms, Float, api_name: :timeMs

            # @!method initialize(type:, action: nil, instruction: nil, page_text: nil, page_url: nil, reasoning: nil, task_completed: nil, time_ms: nil)
            #   @param type [String] Type of action taken
            #
            #   @param action [String]
            #
            #   @param instruction [String]
            #
            #   @param page_text [String]
            #
            #   @param page_url [String]
            #
            #   @param reasoning [String] Agent's reasoning for taking this action
            #
            #   @param task_completed [Boolean]
            #
            #   @param time_ms [Float] Time taken for this action in ms
          end

          # @see Stagehand::Models::SessionExecuteResponse::Data::Result#usage
          class Usage < Stagehand::Internal::Type::BaseModel
            # @!attribute inference_time_ms
            #
            #   @return [Float]
            required :inference_time_ms, Float

            # @!attribute input_tokens
            #
            #   @return [Float]
            required :input_tokens, Float

            # @!attribute output_tokens
            #
            #   @return [Float]
            required :output_tokens, Float

            # @!attribute cached_input_tokens
            #
            #   @return [Float, nil]
            optional :cached_input_tokens, Float

            # @!attribute reasoning_tokens
            #
            #   @return [Float, nil]
            optional :reasoning_tokens, Float

            # @!method initialize(inference_time_ms:, input_tokens:, output_tokens:, cached_input_tokens: nil, reasoning_tokens: nil)
            #   @param inference_time_ms [Float]
            #   @param input_tokens [Float]
            #   @param output_tokens [Float]
            #   @param cached_input_tokens [Float]
            #   @param reasoning_tokens [Float]
          end
        end
      end
    end
  end
end
