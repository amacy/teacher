module Refinery
  module Examples
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Examples

      engine_name :refinery_examples

      initializer "register refinerycms_examples plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "examples"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.examples_admin_examples_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/examples/example'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Examples)
      end
    end
  end
end
