class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :level
      t.references :owner, foreign_key: { to_table: :users }
      t.string :address
      t.integer :price
      t.datetime :date_time
      t.integer :capacity
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
