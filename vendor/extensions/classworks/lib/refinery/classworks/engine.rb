module Refinery
  module Classworks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Classworks

      engine_name :refinery_classworks

      initializer "register refinerycms_classworks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "classworks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.classworks_admin_classworks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/classworks/classwork'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Classworks)
      end
    end
  end
end
