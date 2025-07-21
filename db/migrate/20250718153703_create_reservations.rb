class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :court,      null: false, foreign_key: true
      t.datetime :start_time,   null: false
      t.datetime :end_time,     null: false
      t.integer :player_count,  null: false, default: 1
      t.integer :status,        null: false, default: 0

      t.timestamps
    end
  end
end
