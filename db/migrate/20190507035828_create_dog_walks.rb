class CreateDogWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_walks do |t|
      t.string :title

      t.string :status

      t.datetime :scheduled_datetime
      t.datetime :started_at
      t.datetime :finished_at

      t.decimal :price, scale: 2, precision: 5

      t.float :latitude
      t.float :longitude

      t.text :notes
      t.timestamps
    end
  end
end
