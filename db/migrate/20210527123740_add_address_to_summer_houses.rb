class AddAddressToSummerHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :summer_houses, :address, :string
  end
end
