module Api
  module V1
    module ResponseConcerns
      def json_pagination(collection, serializer, status = :ok)
        data = {
          pagination: {
            total: collection.total_count,
            pages: collection.total_pages,
            current_page: collection.current_page,
            per_page: collection.limit_value
          },
          entries: serializer.serializer_array(collection)
        }

        json_default(result: 'success', data: data, status: status)
      end

      def json_error_response(messages, status = :unprocessable_entity)
        json_default(result: 'failure', messages: messages, status: status)
      end

      private

      def json_default(result:, messages: [], data: nil, status:)
        render json: {
          request_id: (request.request_id rescue nil),
          result: result,
          messages: normalize_messages(messages),
          data: data
        }, status: status
      end

      def normalize_messages(messages)
        return [] unless messages
        return messages if messages.is_a? Array
        [messages]
      end
    end
  end
end
