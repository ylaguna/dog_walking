class Api::V1::DogWalkController < ApplicationController

  def index
    json_pagination(DogWalk.limit(25), nil)
  end
end
