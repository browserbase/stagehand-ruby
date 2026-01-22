# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#replay
    class SessionReplayResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionReplayResponse::Data]
      required :data, -> { Stagehand::Models::SessionReplayResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionReplayResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Stagehand::Models::SessionReplayResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute pages
        #
        #   @return [Array<Stagehand::Models::SessionReplayResponse::Data::Page>, nil]
        optional :pages,
                 -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionReplayResponse::Data::Page] }

        # @!method initialize(pages: nil)
        #   @param pages [Array<Stagehand::Models::SessionReplayResponse::Data::Page>]

        class Page < Stagehand::Internal::Type::BaseModel
          # @!attribute actions
          #
          #   @return [Array<Stagehand::Models::SessionReplayResponse::Data::Page::Action>, nil]
          optional :actions,
                   -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionReplayResponse::Data::Page::Action] }

          # @!method initialize(actions: nil)
          #   @param actions [Array<Stagehand::Models::SessionReplayResponse::Data::Page::Action>]

          class Action < Stagehand::Internal::Type::BaseModel
            # @!attribute method_
            #
            #   @return [String, nil]
            optional :method_, String, api_name: :method

            # @!attribute token_usage
            #
            #   @return [Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage, nil]
            optional :token_usage,
                     -> { Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage },
                     api_name: :tokenUsage

            # @!method initialize(method_: nil, token_usage: nil)
            #   @param method_ [String]
            #   @param token_usage [Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage]

            # @see Stagehand::Models::SessionReplayResponse::Data::Page::Action#token_usage
            class TokenUsage < Stagehand::Internal::Type::BaseModel
              # @!attribute cached_input_tokens
              #
              #   @return [Float, nil]
              optional :cached_input_tokens, Float, api_name: :cachedInputTokens

              # @!attribute input_tokens
              #
              #   @return [Float, nil]
              optional :input_tokens, Float, api_name: :inputTokens

              # @!attribute output_tokens
              #
              #   @return [Float, nil]
              optional :output_tokens, Float, api_name: :outputTokens

              # @!attribute reasoning_tokens
              #
              #   @return [Float, nil]
              optional :reasoning_tokens, Float, api_name: :reasoningTokens

              # @!attribute time_ms
              #
              #   @return [Float, nil]
              optional :time_ms, Float, api_name: :timeMs

              # @!method initialize(cached_input_tokens: nil, input_tokens: nil, output_tokens: nil, reasoning_tokens: nil, time_ms: nil)
              #   @param cached_input_tokens [Float]
              #   @param input_tokens [Float]
              #   @param output_tokens [Float]
              #   @param reasoning_tokens [Float]
              #   @param time_ms [Float]
            end
          end
        end
      end
    end
  end
end
