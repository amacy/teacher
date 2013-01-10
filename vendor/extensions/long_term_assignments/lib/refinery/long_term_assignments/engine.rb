module Refinery
  module LongTermAssignments
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::LongTermAssignments

      engine_name :refinery_long_term_assignments

      initializer "register refinerycms_long_term_assignments plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "long_term_assignments"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.long_term_assignments_admin_long_term_assignments_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/long_term_assignments/long_term_assignment'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::LongTermAssignments)
      end
    end
  end
end
