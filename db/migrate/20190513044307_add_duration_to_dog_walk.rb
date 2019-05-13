class AddDurationToDogWalk < ActiveRecord::Migration[6.0]
  def change
    add_column :dog_walks, :duration, :string
  end
end
