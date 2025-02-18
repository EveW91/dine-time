class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.string :status
      t.integer :party_size

      t.timestamps
    end
  end
end
