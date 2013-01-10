module Refinery
  class LongTermAssignmentsGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_long_term_assignments:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Long Term Assignments extension
Refinery::LongTermAssignments::Engine.load_seed
        EOH
      end
    end
  end
end
