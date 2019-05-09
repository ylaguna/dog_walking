module Api
  module V1
    module ResponseConcerns
      def json_pagination(collection, serializer, status = :ok)
        data = {
          pagination: {
            total: 100,#collection.total_count,
            pages: 4,#collection.total_pages,
            current_page: 1,#collection.current_page,
            per_page: 25,#collection.limit_value
          },
          entries: collection# serializer.serializer_array(collection)
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
          messages: messages,
          data: data
        }, status: status
      end
    end
  end
end