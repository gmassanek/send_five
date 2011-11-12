class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.boolean :registered, :default => false

      t.timestamps
    end
  end
end
