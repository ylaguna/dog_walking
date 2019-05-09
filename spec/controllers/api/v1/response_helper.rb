module Api
  module V1
    module ResponseHelper
      def response_entries
        response_data['entries']
      end

      def response_per_page
        response_pagination['per_page']
      end

      def response_current_page
        response_pagination['current_page']
      end

      def response_pagination
        response_data['pagination']
      end

      def response_data
        response_body['data']
      end

      def response_body
        JSON.parse(response.body)
      end
    end
  end
end
