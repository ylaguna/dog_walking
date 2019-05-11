class Api::V1::DogWalkIndexSerializer < Api::Serializer
  attributes :id, :title, :scheduled_datetime

  attribute :pets_count do |obj|
    obj.pets.count
  end
end
