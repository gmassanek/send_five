# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111213160038) do

  create_table "codes", :force => true do |t|
    t.integer   "vendor_id"
    t.integer   "gift_id"
    t.string    "code_number"
    t.boolean   "sent",        :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.integer   "giver_id"
    t.integer   "receiver_id"
    t.string    "message"
    t.boolean   "random",      :default => false
    t.string    "thank_you"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "sent",        :default => false
  end

  create_table "users", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "phone_number"
    t.string    "email"
    t.string    "password_digest"
    t.boolean   "registered",      :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string    "name"
    t.boolean   "charity",    :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
