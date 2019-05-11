class DogWalk < ApplicationRecord
  enum status: {
    waiting_to_start: 'waiting_to_start',
    started: 'started',
    finished: 'finished'
  }

  has_many :pets, class_name: 'DogWalkPet'
end
