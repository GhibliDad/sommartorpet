class AddCoordinatesToSummerHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :summer_houses, :latitude, :float
    add_column :summer_houses, :longitude, :float
  end
end
