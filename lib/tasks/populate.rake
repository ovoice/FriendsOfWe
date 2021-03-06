namespace :db do
  
  desc "fill empty database with fake data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    more_false = %w(true false false false)
    more_true = %w(false true true true)
    user_types = %w(band_member booking_agent promoter venue_owner)
    project_statuses = %w(recruting planning launched)
    project_states = %w(publish publish publish archived deleted draft)
    
    puts "TODO: creating user skills... "
    
    puts "creating users..."
    User.populate(400) do |user|
      user.name          = Faker::Name.name
      user.email         = Faker::Internet.email
      user.title         = "#{Faker::Lorem.words(1)} title"
      user.allow_email   = more_true
      user.allow_contact = more_false
      user.login_count   = 0
      user.failed_login_count = 0
    end
    puts "create test and admin users..."
    User.create(:name => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test" )
    User.create(:name => "admin", :email => "admin@test.com", :password => "admin", :password_confirmation => "admin", :state => 'admin' )
    user_ids = User.all.collect(&:id)    
    
    puts "creating projects, with opportunities and opportunities..."
    Project.populate(30) do |project|
      project.name         = Populator.words(ActiveSupport::SecureRandom.random_number(4)+1).titleize
      project.description  = Faker::Lorem.sentences(5)
      project.activities   = Faker::Lorem.sentences(8)
      project.status       = project_statuses
      project.state        = project_states
      project.volunteer_count = 10 #FIX ME
      Opportunity.populate(ActiveSupport::SecureRandom.random_number(17))  do |opportunity|
        opportunity.name       = Populator.words(ActiveSupport::SecureRandom.random_number(3)+1)
        opportunity.project_id = project.id
      end
      Commitment.populate(ActiveSupport::SecureRandom.random_number(10)+3)  do |commitment|
        commitment.name       = Populator.words(ActiveSupport::SecureRandom.random_number(2)+1)
        commitment.project_id = project.id
        commitment.user_id    = user_ids.rand
        commitment.state      = 'confirmed'
      end
      
    end
    project_ids = Project.all.collect(&:id)
    
    puts "setting featured and publising recuting projects..."
    3.times{Project.update(project_ids.rand, :featured => true, :state => 'publish')}
    Project.update_all("status = 'recruiting'", "state = 'publish'")
    
    puts "TODO: creating project tags... "    
    puts "TODO LATER? create photos... "
    
    puts "create links... "
    Link.populate(75) do |link|
      link.name           = Populator.words(ActiveSupport::SecureRandom.random_number(4)+1)
      link.url            = Faker::Internet.domain_name
      link.description    = Faker::Lorem.words(8)
      link.assetable_id   = project_ids
      link.assetable_type = "Project"
    end
    
    puts "create documents... TODO: (?) add file information"
    Document.populate(75) do |document|
      document.name         = Populator.words(ActiveSupport::SecureRandom.random_number(4)+1)
      document.description  = Faker::Lorem.words(8)
      document.assetable_id  = project_ids
      document.assetable_type   = "Project"
    end
    
  end
  
  desc "builds DB from scratch"
  task :build => :environment do 
    puts "building database..."
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    Rake::Task["railmail:install"].invoke
  end
  
  desc "destroys and rebuilds DB from scratch"
  task :rebuild => :environment do
    puts "destroying database..."
    Rake::Task["db:drop"].invoke
    Rake::Task["db:build"].invoke
  end
  
  desc "destroys and repopulates database with fake data"
  task :repopulate => [:rebuild, :populate]
  
end
