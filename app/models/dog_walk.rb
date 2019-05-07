class DogWalk < ApplicationRecord
  enum status: {
    waiting_to_start: 'waiting_to_start',
    started: 'started',
    finished: 'finished'
  }
end
