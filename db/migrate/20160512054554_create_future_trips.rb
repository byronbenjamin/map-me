class CreateFutureTrips < ActiveRecord::Migration
  def change
    create_table :future_trips do |t|
      t.integer :user_id
      t.string :location
      t.string :month
      t.string :year
      t.string :description

      t.timestamps null: false
    end
  end
end
