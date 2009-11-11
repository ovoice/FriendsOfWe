namespace :db do
  
  desc "Destroys and rebuilds DB"
  task :rebuild => :environment do 
    puts 'rebuilding database...'
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end
  
  desc "fill empty database with fake data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    more_false = %w(true false false false)
    more_true = %w(false true true true)
    user_types = %w(band_member booking_agent promoter venue_owner)
    project_statuses = %w(recruting planning launched)
    
    puts "TODO: creating user skills... "
    
    puts "creating users..."
    User.populate(400) do |user|
      user.name      = Faker::Name.name
      user.bio       = Faker::Lorem.sentences
      user.email     = Faker::Internet.email
      user.title     = Faker::Lorem.words(1) + " title"
    end
    User.create(:name => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test" )
    user_ids = User.all.collect(&:id)
    
    
    
    puts "creating projects..."
    Project.populate(30) do |project|
      project.name         = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(3)+1)
      project.description  = Faker::Lorem.sentences(5)
      project.activities   = Faker::Lorem.sentences(8)
      project.status       = project_statuses
      project.volunteer_count = 10 #FIX ME
    end
    project_ids = Project.all.collect(&:id)
    
    puts "associating users and projects through commitments..."
    Project.find_each do |project|
      (ActiveSupport::SecureRandom.random_number(10)).times do 
        project.users << User.find(user_ids.rand)
      end
    end
    
    puts "TODO: creating project tags... "
    
    
    
    puts "TODO LATER? create photos... "
    
    puts "create links... "
    Link.populate(75) do |link|
      link.name        = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(3)+1)
      link.url         = Faker::Internet.domain_name
      link.description = Faker::Lorem.words(8)
      link.project_id  = project_ids
    end
    
    puts "create documents... "
    Document.populate(75) do |document|
      document.name = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(3)+1)
      document.description = Faker::Lorem.words(8)
      documents.project_id  = project_ids
    end
    
  end
  
  desc "destroys and repopulates database with fake data"
  task :repopulate => [:rebuild, :populate]
  
end
