class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :user_id
      t.string :location
      t.string :month
      t.string :year
      t.string :description
      t.string :method_of_travel

      t.timestamps null: false
    end
  end
end
