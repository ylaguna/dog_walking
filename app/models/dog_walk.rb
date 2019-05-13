class DogWalk < ApplicationRecord
  validates :title, :latitude, :longitude, :status, :duration, presence: true

  enum status: {
    waiting_to_start: 'waiting_to_start',
    started: 'started',
    finished: 'finished'
  }

  enum duration: {
    half_hour_duration: 'half_hour',
    full_hour_duration: 'full_hour',
  }

  has_many :pets, class_name: 'DogWalkPet'

  before_save :set_price
  before_validation :set_initial_status, on: :create

  private

  def set_price
    self.price = base_price + aditional_price * (pets.count - 1)
  end

  def base_price
    half_hour_duration? ? 25 : 35
  end

  def aditional_price
    half_hour_duration? ? 15 : 20
  end

  def set_initial_status
    self.status = 'waiting_to_start'
  end
end
