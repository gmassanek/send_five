class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.string :message
      t.boolean :random, :default => false
      t.string :thank_you

      t.timestamps
    end
  end
end
