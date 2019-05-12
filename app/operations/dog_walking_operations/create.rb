class DogWalkingOperations::Create < Operation
  # {
  #   title: String
  #   scheduled_datetime: Datetime
  #   status: opts ['started', 'finished' ]
  #   location: [
  #     latitude: Float
  #     longitude Float
  #   ]
  #   walk_type: Integer
  #   Pets: [
  #     name: String
  #     race: String
  #     age: Integer
  #     observation: String (not required)
  #   ]
  # }
  def process(params)
    return unless validate(params)

    dog_walk = DogWalk.create! do |dog_walk|
      dog_walk.title = params[:title]
      dog_walk.scheduled_datetime = params[:scheduled_datetime]
      dog_walk.latitude = params[:location][:latitude]
      dog_walk.longitude = params[:location][:longitude]

      dog_walk.pets = params[:pets].map do |pet|
        DogWalkPet.new(name: pet[:name],
          age: pet[:age],
          race: pet[:race],
          observation: pet[:observation]
        )
      end
    end

    @result.assign(:entry, dog_walk)
  end

  def validate(params)
    @result.add_error 'title is required' unless params[:title]
    @result.add_error 'scheduled_datetime is required' unless params[:scheduled_datetime]
    @result.add_error 'location is required' unless params[:location]
    @result.add_error 'walk_type is required' unless params[:walk_type]
    @result.add_error 'pets is required' unless params[:pets]

    @result.success?
  end
end
