class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :account_name
      t.string :email
      t.string :encrypted_password
      t.integer :role

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
