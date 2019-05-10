class ApplicationController < ActionController::API
  include Api::V1::ResponseConcerns
  include Api::V1::ExceptionConcerns
end
