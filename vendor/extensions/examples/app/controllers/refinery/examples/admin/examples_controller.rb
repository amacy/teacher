module Refinery
  module Examples
    module Admin
      class ExamplesController < ::Refinery::AdminController

        crudify :'refinery/examples/example', :xhr_paging => true

      end
    end
  end
end
