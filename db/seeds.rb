# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Vendor.destroy_all
Vendor.create(:name => "Snarfs")
Vendor.create(:name => "Starbucks")
Vendor.create(:name => "Motel Bar")
Vendor.create(:name => "Humane Society", :charity => true)
Vendor.create(:name => "Jim Dugans", :charity => true)

puts "Created #{Vendor.count} Vendors"

Code.destroy_all
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => 8)
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => 7)
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => 5)
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => 3)
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => 9)

puts "Created #{Code.count} Codes"
