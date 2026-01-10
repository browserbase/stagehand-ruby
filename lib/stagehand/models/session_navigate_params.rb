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
      #   Target frame ID for the navigation
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionNavigateParams::Options, nil]
      optional :options, -> { Stagehand::SessionNavigateParams::Options }

      # @!attribute stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Boolean, nil]
      optional :stream_response, Stagehand::Internal::Type::Boolean, api_name: :streamResponse

      # @!attribute x_sent_at
      #   ISO timestamp when request was sent
      #
      #   @return [Time, nil]
      optional :x_sent_at, Time

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionNavigateParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionNavigateParams::XStreamResponse }

      # @!method initialize(url:, frame_id: nil, options: nil, stream_response: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param url [String] URL to navigate to
      #
      #   @param frame_id [String] Target frame ID for the navigation
      #
      #   @param options [Stagehand::Models::SessionNavigateParams::Options]
      #
      #   @param stream_response [Boolean] Whether to stream the response via SSE
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionNavigateParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute referer
        #   Referer header to send with the request
        #
        #   @return [String, nil]
        optional :referer, String

        # @!attribute timeout
        #   Timeout in ms for the navigation
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute wait_until
        #   When to consider navigation complete
        #
        #   @return [Symbol, Stagehand::Models::SessionNavigateParams::Options::WaitUntil, nil]
        optional :wait_until,
                 enum: -> { Stagehand::SessionNavigateParams::Options::WaitUntil },
                 api_name: :waitUntil

        # @!method initialize(referer: nil, timeout: nil, wait_until: nil)
        #   @param referer [String] Referer header to send with the request
        #
        #   @param timeout [Float] Timeout in ms for the navigation
        #
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
