class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do|t|
      t.string :name
      t.boolean :charity, :default => false
      
      t.timestamps
    end
  end
end
