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
Vendor.create(:name => "Red Cross", :charity => true)

puts "Created #{Vendor.count} Vendors"

Code.destroy_all
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '834-AB34333')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '7234 3211 0988 2343')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '5A-2343009')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '3FC221-88')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9FC2 21F2 2343 9922')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '2349FT 2343')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '923423XX2')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '92342 123S')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9987 2343 1234 3242')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9FC2 21F2 2343 9922')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9FC2 21F2 2343 9922')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9FC2 21F2 2343 9922')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '2349FT 2343')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '923423XX2')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '92342 123S')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9987 2343 1234 3242')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '2349FT 2343')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '923423XX2')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '92342 123S')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9987 2343 1234 3242')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '2349FT 2343')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '923423XX2')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '92342 123S')
Code.create(:vendor => Vendor.all.shuffle.first, :code_number => '9987 2343 1234 3242')

puts "Created #{Code.count} Codes"
