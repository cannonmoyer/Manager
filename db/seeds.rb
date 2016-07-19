# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'admin@finaltouchsecurity.com', level: 'Admin', password: 'password', password_confirmation: 'password')
Account.create!(name: 'Bob', line_number: 'M', number: '1234')
Account.create!(name: 'Bob', line_number: 'M', number: '1234')
Account.create!(name: 'Bob', line_number: 'M', number: '1234')
Account.create!(name: 'Bob', line_number: 'M', number: '1234')
Account.create!(name: 'Bob', line_number: 'M', number: '1234')