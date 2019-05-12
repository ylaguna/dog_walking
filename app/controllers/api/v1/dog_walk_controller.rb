class Api::V1::DogWalkController < ApplicationController
  def index
    search_options = params.to_unsafe_h

    json_pagination(
      Api::V1::DogWalkSearch.new(search_options).search,
      Api::V1::DogWalkIndexSerializer
    )
  end

  def show
    dog_walk = find_dog_walk

    json_success_response(
      dog_walk,
      Api::V1::DogWalkShowSerializer
    )
  end

  def update
    dog_walk = find_dog_walk

    result = DogWalkingOperations::Toogle.call(
      dog_walk: dog_walk,
      new_status: update_params[:new_status]
    )

    if result.failure?
      json_error_response(result.errors, :bad_request)
      return
    end

    json_success_response(
      dog_walk,
      Api::V1::DogWalkShowSerializer
    )
  end

  def create
    result = DogWalkingOperations::Create.call(params.to_unsafe_h)

    if result.failure?
      json_error_response(result.errors, :bad_request)
      return
    end

    json_success_response(
      result.data[:entry],
      Api::V1::DogWalkShowSerializer
    )
  end

  private

  def find_dog_walk
    DogWalk.find(params.require(:id))
  end

  def update_params
    params.permit(:id, :new_status)
  end
end
