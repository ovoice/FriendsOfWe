# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:email => 'mario@origalvoice.com', :state => 'admin', :allow_contact => true, :allow_email => true, :password => 'updateMe', :password_confirmation => 'updateMe')
User.create(:email => 'admin@friendsofwe.org', :state => 'admin', :allow_contact => true, :allow_email => true, :password => 'updateMe', :password_confirmation => 'updateMe')
