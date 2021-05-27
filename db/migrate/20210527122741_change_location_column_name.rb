class ChangeLocationColumnName < ActiveRecord::Migration[6.0]
  def change
     rename_column :summer_houses, :location, :city
  end
end
