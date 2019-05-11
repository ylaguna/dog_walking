class DogWalkPet < ApplicationRecord
  belongs_to :dog_walk

  validates :name, :race, :age, presence: true
end
