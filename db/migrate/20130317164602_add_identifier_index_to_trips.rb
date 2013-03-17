class AddIdentifierIndexToTrips < ActiveRecord::Migration
  def change
    add_index :trips, :identifier
  end
end
