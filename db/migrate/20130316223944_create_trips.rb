class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :identifier
      t.string :route
      t.string :next_stop
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
