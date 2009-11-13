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
      user.email     = Faker::Internet.email
      user.title     = "#{Faker::Lorem.words(1)} title"
      user.login_count = 0
      user.failed_login_count = 0
    end
    puts "create test and admin users..."
    User.create(:name => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test" )
    User.create(:name => "admin", :email => "admin@test.com", :password => "admin", :password_confirmation => "admin", :state => 'admin' )
    user_ids = User.all.collect(&:id)
    
    
    
    puts "creating projects..."
    Project.populate(30) do |project|
      project.name         = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(6)+1)
      project.description  = Faker::Lorem.sentences(5)
      project.activities   = Faker::Lorem.sentences(8)
      project.status       = project_statuses
      project.volunteer_count = 10 #FIX ME
      Opportunity.populate(ActiveSupport::SecureRandom.random_number(7)) do |opportunity|
        opportunity.project_id = project.id
        opportunity.name = Faker::Lorem.words(2)
      end
    end
    project_ids = Project.all.collect(&:id)
    
    puts "setting featured projcets..."
    3.times{Project.update(project_ids.rand, :featured => true)}
    
    puts "associating users and projects through commitments..."
    Opportunity.find_each do |opportunity|
      (ActiveSupport::SecureRandom.random_number(10)).times do 
        opportunity.volunteers << User.find(user_ids.rand)
      end
    end
    Commitment.update_all(:state => 'confirmed')
    
    puts "TODO: creating project tags... "
    
    
    
    puts "TODO LATER? create photos... "
    
    puts "create links... "
    Link.populate(75) do |link|
      link.name           = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(3)+1)
      link.url            = Faker::Internet.domain_name
      link.description    = Faker::Lorem.words(8)
      link.assetable_id   = project_ids
      link.assetable_type = "Project"
    end
    
    puts "create documents... TODO: (?) add file information"
    Document.populate(75) do |document|
      document.name         = Faker::Lorem.words(ActiveSupport::SecureRandom.random_number(3)+1)
      document.description  = Faker::Lorem.words(8)
      document.assetable_id  = project_ids
      document.assetable_type   = "Project"
    end
    
  end
  
  desc "destroys and repopulates database with fake data"
  task :repopulate => [:rebuild, :populate]
  
end
