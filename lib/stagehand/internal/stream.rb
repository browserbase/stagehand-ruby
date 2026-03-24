# frozen_string_literal: true

module Stagehand
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |event|
    #     puts(event)
    #   end
    class Stream
      include Stagehand::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        @iterator ||= Stagehand::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do |msg|
            case msg
            in {event: "error", data: String => data}
              decoded = Kernel.then do
                JSON.parse(data, symbolize_names: true)
              rescue JSON::ParserError
                data
              end
              err = Stagehand::Errors::APIStatusError.for(
                url: @url,
                status: @status,
                headers: @headers,
                body: decoded,
                request: nil,
                response: @response
              )
              raise err
            in {event: "starting" | "connected" | "running" | "finished", data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Stagehand::Internal::Util.dig(decoded, @unwrap)
              y << Stagehand::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
      end
    end
  end
end
