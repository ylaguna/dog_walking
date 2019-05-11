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

  private

  def find_dog_walk
    DogWalk.find(params.require(:id))
  end
end
