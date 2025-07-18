class CreateCourts < ActiveRecord::Migration[7.1]
  def change
    create_table :courts do |t|
      t.string :name,          null: false
      t.integer :max_players,  null: false, default: 4
      t.text :description

      t.timestamps
    end
  end
end
