class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.integer :num_guests
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
