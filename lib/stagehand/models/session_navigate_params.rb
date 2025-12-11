# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#navigate
    class SessionNavigateParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute url
      #   URL to navigate to
      #
      #   @return [String]
      required :url, String

      # @!attribute frame_id
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionNavigateParams::Options, nil]
      optional :options, -> { Stagehand::SessionNavigateParams::Options }

      # @!attribute x_stream_response
      #
      #   @return [Symbol, Stagehand::Models::SessionNavigateParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionNavigateParams::XStreamResponse }

      # @!method initialize(url:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param url [String] URL to navigate to
      #
      #   @param frame_id [String]
      #
      #   @param options [Stagehand::Models::SessionNavigateParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionNavigateParams::XStreamResponse]
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute wait_until
        #   When to consider navigation complete
        #
        #   @return [Symbol, Stagehand::Models::SessionNavigateParams::Options::WaitUntil, nil]
        optional :wait_until,
                 enum: -> { Stagehand::SessionNavigateParams::Options::WaitUntil },
                 api_name: :waitUntil

        # @!method initialize(wait_until: nil)
        #   @param wait_until [Symbol, Stagehand::Models::SessionNavigateParams::Options::WaitUntil] When to consider navigation complete

        # When to consider navigation complete
        #
        # @see Stagehand::Models::SessionNavigateParams::Options#wait_until
        module WaitUntil
          extend Stagehand::Internal::Type::Enum

          LOAD = :load
          DOMCONTENTLOADED = :domcontentloaded
          NETWORKIDLE = :networkidle

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

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
