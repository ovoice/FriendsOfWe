# This file should contain all the record creation needed to seed the database with its default values.

User.create(:email => 'mario@origalvoice.com', :state => 'admin', :allow_contact => true, :allow_email => true, :password => 'updateMe', :password_confirmation => 'updateMe')
User.create(:email => 'admin@friendsofwe.org', :state => 'admin', :allow_contact => true, :allow_email => true, :password => 'updateMe', :password_confirmation => 'updateMe')

p = Project.new(
  :name => '"Turn Off" IT Campaign',
  :description => "In the United States, 50% of employed adults don't typically shut down their PCs at the end of the work day. A single company with 10,000 PCs wastes more than $260,000 annually and generates 1,871 tons of CO2 emissions. numbers improve in the UK and Germany, but there is a still a lot that could be done. The \"Turn Off\" campaign is a targeted appeal to IT administrators to encourage their companies' employees to turn off their computers at the end of each work day.",
  :activities => "While still in the planning phase, our general goal is to create a digital campaign that drives IT administrators to learn more about how they can reduce their company's IT energy consumption for the good of the environment and their firm's bottom lines. A content inventory and the development of a messaging strategy are in progress.",
  :status => 'recruiting',
  :state => 'publish',
  :featured => true)
p.links << Link.create(:name => 'PC Energy Report 2009', :url => 'http://www.1e.com/energycampaign/index.aspx', :description => 'An annual study from 1e.com that helps illustrate the need and trends in IT energy consumption.')
p.save
  
p = Project.new(
  :name => 'The Effects of Climate Change',
  :description => 'A recent Gallup poll found that fewer and fewer Americans understand how climate change will impact their lives or the lives of their children.  With the recent media-hyped contrevercy surrounding "Climate-gate", these numbers have likely fallen further still.  The "Effects of Climate Change" campaign is an effort to help Americans accept the realities of Climate Change by understand how it will impact their lives. Fortunately, the hard work of content creation has largely already been completed in a White House report issues in June of this Year.',
  :activities => "While still in the planning phase, our first efforts will focus on development of a messaging strategy and development of a consumer friendly, motion-graphics heavy, rich media landing site.  The White House report is an excellent report that readily lends itself to the creation of engaging, dyanmic content. With these foundations we can begin work on general and digital advertising with Television Public Service Advertising (PSA) and digital PSAs. ",
  :status => 'recruiting',
  :state => 'publish',
  :featured => true)
p.links <<  Link.create(:name => 'Global Climate Change Impacts in the United States', :url => 'http://www.globalchange.gov/publications/reports/scientific-assessments/us-impacts', :description => 'The official White House report on the science and the impacts of climate change on the United States.')
p.save
  
p = Project.new(
  :name => 'FriendsOfWe.org Enhancements',
  :description => 'Help us build and grow the FriendsOfWe.org website as a tool to help volunteers more effectively get involved on the projects they are passionate about.',
  :activities => "We are looking for rails developers to help add features and suggest improvements via github.",
  :status => 'recruiting',
  :state => 'publish',
  :featured => true)
p.links = [
  Link.create(:name => 'Development plans', :url => 'https://github.com/ovoice/FriendsOfWe/wikis/development-plans', :description => 'FOW\'s Development plans on Github'),
  Link.create(:name => 'Suggestions', :url => 'http://github.com/ovoice/FriendsOfWe', :description => 'FOW\'s issues(suggestions) page on github')]
p.save