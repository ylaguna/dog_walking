class Api::V1::DogWalkController < ApplicationController

  def index
    search_options = params.to_unsafe_h

    json_pagination(
      Api::V1::DogWalkSearch.new(search_options).search,
      nil
    )
  end
end
