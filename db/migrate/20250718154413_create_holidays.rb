class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays do |t|
      t.references :court, null: false, foreign_key: true
      t.date :date,        null: false
      t.string :note

      t.timestamps
    end
  end
end
