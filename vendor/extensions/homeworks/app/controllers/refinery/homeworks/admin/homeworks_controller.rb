module Refinery
  module Homeworks
    module Admin
      class HomeworksController < ::Refinery::AdminController

        crudify :'refinery/homeworks/homework', :xhr_paging => true

      end
    end
  end
end
