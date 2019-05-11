class DogWalk < ApplicationRecord
  validates :title, :latitude, :longitude, :status, presence: true

  enum status: {
    waiting_to_start: 'waiting_to_start',
    started: 'started',
    finished: 'finished'
  }

  has_many :pets, class_name: 'DogWalkPet'

  before_save :set_price
  before_validation :set_initial_status, on: :create

  private

  def set_price
    self.price = 1
  end

  def set_initial_status
    self.status = 'waiting_to_start'
  end
end
