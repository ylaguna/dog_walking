class DogWalkPet < ApplicationRecord
  belongs_to :dog_walk

  validates :name, :race, :age, presence: true

  after_save :update_walk

  private

  def update_walk
    self.dog_walk.save!
  end
end
