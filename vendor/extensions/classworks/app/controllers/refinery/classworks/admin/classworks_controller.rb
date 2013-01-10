module Refinery
  module Classworks
    module Admin
      class ClassworksController < ::Refinery::AdminController

        crudify :'refinery/classworks/classwork', :xhr_paging => true

      end
    end
  end
end
