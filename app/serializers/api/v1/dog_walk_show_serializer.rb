class Api::V1::DogWalkShowSerializer < Api::Serializer
  attributes :id, :title, :scheduled_datetime,
    :started_at, :finished_at,
    :price, :status

  attribute :pets do |obj|
    obj.pets.map do |pet|
      {
        name: pet.name,
        race: pet.race,
        age:  pet.age,
        observation: pet.observation
      }
    end
  end

  attribute :location do |obj|
    {
      latitude: obj.latitude,
      longitude: obj.longitude
    }
  end

  attribute :walked_time do |obj|
  end
end
