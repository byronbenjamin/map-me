class CreateFutureTrips < ActiveRecord::Migration
  def change
    create_table :future_trips do |t|
      t.string :name
      t.integer :user_id
      t.float :longitude
      t.float :latitude
      t.string :location
      t.string :month
      t.string :year
      t.string :description

      t.timestamps null: false
    end
  end
end
