class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.references :user, null: false, foreign_key: true
      t.time :opening_time
      t.time :closing_time
      t.string :street_address
      t.string :city
      t.string :postcode
      t.string :county

      t.timestamps
    end
  end
end
