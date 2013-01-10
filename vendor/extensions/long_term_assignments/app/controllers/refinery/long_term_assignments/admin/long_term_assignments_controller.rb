module Refinery
  module LongTermAssignments
    module Admin
      class LongTermAssignmentsController < ::Refinery::AdminController

        crudify :'refinery/long_term_assignments/long_term_assignment', :xhr_paging => true

      end
    end
  end
end
