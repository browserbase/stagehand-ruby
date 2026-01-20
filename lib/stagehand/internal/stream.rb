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
        # rubocop:disable Metrics/BlockLength
        @iterator ||= Stagehand::Internal::Util.chain_fused(@stream) do |y|
          consume = false

          @stream.each do |msg|
            next if consume

            case msg
            in {data: String => data} if data.start_with?("finished")
              consume = true
              next
            in {data: String => data} if data.start_with?("error")
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
            in {event: nil, data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Stagehand::Internal::Util.dig(decoded, @unwrap)
              y << Stagehand::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
        # rubocop:enable Metrics/BlockLength
      end
    end
  end
end
