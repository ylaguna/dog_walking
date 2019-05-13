module Api
  module V1
    class DogWalkSearch < Api::Search
      private

      def search_class
        DogWalk
      end

      def permitted_sort_attributes
        []
      end

      def default_sort_attribute
        :scheduled_datetime
      end

      def default_order_attribute
        :asc
      end

      def search_includes
        #pets
      end

      def search_filter
        { status: [ 'started', 'waiting_to_start'] } unless @options['showOld'] == 'true'
      end
    end
  end
end
