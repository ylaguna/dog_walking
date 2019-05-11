class CreateDogWalkPets < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_walk_pets do |t|
      t.belongs_to :dog_walk
      t.string :name
      t.integer :age
      t.string :race
      t.string :observation

      t.timestamps
    end
  end
end
