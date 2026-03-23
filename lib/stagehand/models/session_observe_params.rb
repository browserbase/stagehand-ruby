# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#observe
    #
    # @see Stagehand::Resources::Sessions#observe_streaming
    class SessionObserveParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute id
      #   Unique session identifier
      #
      #   @return [String]
      required :id, String

      # @!attribute frame_id
      #   Target frame ID for the observation
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute instruction
      #   Natural language instruction for what actions to find
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionObserveParams::Options, nil]
      optional :options, -> { Stagehand::SessionObserveParams::Options }

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionObserveParams::XStreamResponse }

      # @!method initialize(id:, frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param id [String] Unique session identifier
      #
      #   @param frame_id [String, nil] Target frame ID for the observation
      #
      #   @param instruction [String] Natural language instruction for what actions to find
      #
      #   @param options [Stagehand::Models::SessionObserveParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #   Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @return [Stagehand::Models::ModelConfig, String, nil]
        optional :model, union: -> { Stagehand::SessionObserveParams::Options::Model }

        # @!attribute selector
        #   CSS selector to scope observation to a specific element
        #
        #   @return [String, nil]
        optional :selector, String

        # @!attribute timeout
        #   Timeout in ms for the observation
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute variables
        #   Variables whose names are exposed to the model so observe() returns
        #   %variableName% placeholders in suggested action arguments instead of literal
        #   values. Accepts flat primitives or { value, description? } objects.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionObserveParams::Options::Variable::UnionMember3}, nil]
        optional :variables,
                 -> { Stagehand::Internal::Type::HashOf[union: Stagehand::SessionObserveParams::Options::Variable] }

        # @!method initialize(model: nil, selector: nil, timeout: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionObserveParams::Options} for more details.
        #
        #   @param model [Stagehand::Models::ModelConfig, String] Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @param selector [String] CSS selector to scope observation to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the observation
        #
        #   @param variables [Hash{Symbol=>String, Float, Boolean, Stagehand::Models::SessionObserveParams::Options::Variable::UnionMember3}] Variables whose names are exposed to the model so observe() returns %variableNam

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        # @see Stagehand::Models::SessionObserveParams::Options#model
        module Model
          extend Stagehand::Internal::Type::Union

          variant -> { Stagehand::ModelConfig }

          variant String

          # @!method self.variants
          #   @return [Array(Stagehand::Models::ModelConfig, String)]
        end

        module Variable
          extend Stagehand::Internal::Type::Union

          variant String

          variant Float

          variant Stagehand::Internal::Type::Boolean

          variant -> { Stagehand::SessionObserveParams::Options::Variable::UnionMember3 }

          class UnionMember3 < Stagehand::Internal::Type::BaseModel
            # @!attribute value
            #
            #   @return [String, Float, Boolean]
            required :value, union: -> { Stagehand::SessionObserveParams::Options::Variable::UnionMember3::Value }

            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String

            # @!method initialize(value:, description: nil)
            #   @param value [String, Float, Boolean]
            #   @param description [String]

            # @see Stagehand::Models::SessionObserveParams::Options::Variable::UnionMember3#value
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
          #   @return [Array(String, Float, Boolean, Stagehand::Models::SessionObserveParams::Options::Variable::UnionMember3)]
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
