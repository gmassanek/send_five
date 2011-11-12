class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :vendor_id
      t.integer :gift_id
      t.string :code_number
      t.boolean :sent, :default => false

      t.timestamps
    end
  end
end
