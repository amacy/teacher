module Refinery
  module LongTermAssignments
    class LongTermAssignmentsController < ::ApplicationController

      before_filter :find_all_long_term_assignments
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @long_term_assignment in the line below:
        present(@page)
      end

      def show
        @long_term_assignment = LongTermAssignment.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @long_term_assignment in the line below:
        present(@page)
      end

    protected

      def find_all_long_term_assignments
        @long_term_assignments = LongTermAssignment.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/long_term_assignments").first
      end

    end
  end
end
