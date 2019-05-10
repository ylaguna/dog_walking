module Api
  module V1
    module ExceptionConcerns
      extend ActiveSupport::Concern

      included do
        rescue_from StandardError do |e|
          case e
          when ActiveRecord::RecordNotFound
            json_error_response('Resource not found.', :not_found)
          when ActionController::BadRequest
            json_error_response(e.message, :bad_request)
          else
            json_error_response("Something went really bad. Contact support: #{e.message}", :internal_server_error)
          end
        end
      end
    end
  end
end
