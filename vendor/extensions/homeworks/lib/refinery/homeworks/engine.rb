module Refinery
  module Homeworks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Homeworks

      engine_name :refinery_homeworks

      initializer "register refinerycms_homeworks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "homeworks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.homeworks_admin_homeworks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/homeworks/homework'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Homeworks)
      end
    end
  end
end
