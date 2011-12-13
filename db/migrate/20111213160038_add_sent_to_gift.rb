class AddSentToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :sent, :boolean, :default => false
  end
end
