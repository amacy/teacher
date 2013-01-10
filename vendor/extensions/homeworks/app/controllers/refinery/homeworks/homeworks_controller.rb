module Refinery
  module Homeworks
    class HomeworksController < ::ApplicationController

      before_filter :find_all_homeworks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @homework in the line below:
        present(@page)
      end

      def show
        @homework = Homework.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @homework in the line below:
        present(@page)
      end

    protected

      def find_all_homeworks
        @homeworks = Homework.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/homeworks").first
      end

    end
  end
end
