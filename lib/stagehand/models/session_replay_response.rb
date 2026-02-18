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
        #   @return [Array<Stagehand::Models::SessionReplayResponse::Data::Page>]
        required :pages,
                 -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionReplayResponse::Data::Page] }

        # @!attribute client_language
        #
        #   @return [String, nil]
        optional :client_language, String, api_name: :clientLanguage

        # @!method initialize(pages:, client_language: nil)
        #   @param pages [Array<Stagehand::Models::SessionReplayResponse::Data::Page>]
        #   @param client_language [String]

        class Page < Stagehand::Internal::Type::BaseModel
          # @!attribute actions
          #
          #   @return [Array<Stagehand::Models::SessionReplayResponse::Data::Page::Action>]
          required :actions,
                   -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionReplayResponse::Data::Page::Action] }

          # @!attribute duration
          #
          #   @return [Float]
          required :duration, Float

          # @!attribute timestamp
          #
          #   @return [Float]
          required :timestamp, Float

          # @!attribute url
          #
          #   @return [String]
          required :url, String

          # @!method initialize(actions:, duration:, timestamp:, url:)
          #   @param actions [Array<Stagehand::Models::SessionReplayResponse::Data::Page::Action>]
          #   @param duration [Float]
          #   @param timestamp [Float]
          #   @param url [String]

          class Action < Stagehand::Internal::Type::BaseModel
            # @!attribute method_
            #
            #   @return [String]
            required :method_, String, api_name: :method

            # @!attribute parameters
            #
            #   @return [Hash{Symbol=>Object}]
            required :parameters, Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]

            # @!attribute result
            #
            #   @return [Hash{Symbol=>Object}]
            required :result, Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]

            # @!attribute timestamp
            #
            #   @return [Float]
            required :timestamp, Float

            # @!attribute end_time
            #
            #   @return [Float, nil]
            optional :end_time, Float, api_name: :endTime

            # @!attribute token_usage
            #
            #   @return [Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage, nil]
            optional :token_usage,
                     -> { Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage },
                     api_name: :tokenUsage

            # @!method initialize(method_:, parameters:, result:, timestamp:, end_time: nil, token_usage: nil)
            #   @param method_ [String]
            #   @param parameters [Hash{Symbol=>Object}]
            #   @param result [Hash{Symbol=>Object}]
            #   @param timestamp [Float]
            #   @param end_time [Float]
            #   @param token_usage [Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage]

            # @see Stagehand::Models::SessionReplayResponse::Data::Page::Action#token_usage
            class TokenUsage < Stagehand::Internal::Type::BaseModel
              # @!attribute cost
              #
              #   @return [Float, nil]
              optional :cost, Float

              # @!attribute input_tokens
              #
              #   @return [Float, nil]
              optional :input_tokens, Float, api_name: :inputTokens

              # @!attribute output_tokens
              #
              #   @return [Float, nil]
              optional :output_tokens, Float, api_name: :outputTokens

              # @!attribute time_ms
              #
              #   @return [Float, nil]
              optional :time_ms, Float, api_name: :timeMs

              # @!method initialize(cost: nil, input_tokens: nil, output_tokens: nil, time_ms: nil)
              #   @param cost [Float]
              #   @param input_tokens [Float]
              #   @param output_tokens [Float]
              #   @param time_ms [Float]
            end
          end
        end
      end
    end
  end
end
