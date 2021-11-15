class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.date :startingDay
      t.date :endingDay

      t.timestamps
    end
  end
end
