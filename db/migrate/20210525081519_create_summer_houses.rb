class CreateSummerHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :summer_houses do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :location
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
