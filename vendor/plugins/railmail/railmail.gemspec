# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{railmail}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Fleckenstein"]
  s.date = %q{2009-07-28}
  s.email = %q{nullstyle@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/railmail_controller.rb",
     "app/controllers/railmail_controller.rb",
     "app/helpers/railmail_helper.rb",
     "app/helpers/railmail_helper.rb",
     "app/models/railmail_delivery.rb",
     "app/models/railmail_delivery.rb",
     "app/views/layouts/_javascripts.erb",
     "app/views/layouts/_javascripts.erb",
     "app/views/layouts/_styles.erb",
     "app/views/layouts/_styles.erb",
     "app/views/layouts/railmail.html.erb",
     "app/views/layouts/railmail.html.erb",
     "app/views/railmail/_delivery.html.erb",
     "app/views/railmail/_delivery.html.erb",
     "app/views/railmail/index.html.erb",
     "app/views/railmail/index.html.erb",
     "app/views/railmail/read.rjs",
     "app/views/railmail/read.rjs",
     "generators/railmail_migration/USAGE",
     "generators/railmail_migration/USAGE",
     "generators/railmail_migration/railmail_migration_generator.rb",
     "generators/railmail_migration/railmail_migration_generator.rb",
     "generators/railmail_migration/templates/migration.rb",
     "generators/railmail_migration/templates/migration.rb",
     "lib/railmail.rb",
     "lib/railmail.rb",
     "lib/railmail/action_mailer.rb",
     "lib/railmail/action_mailer.rb",
     "railmail.gemspec",
     "rails/init.rb",
     "rails/init.rb",
     "tasks/railmail_tasks.rake",
     "test/.dummy",
     "test/railmail_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/nullstyle/railmail}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Provides a mock actionmailer with a web interface}
  s.test_files = [
    "test/railmail_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
