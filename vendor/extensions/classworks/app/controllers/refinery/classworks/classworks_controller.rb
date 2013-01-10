module Refinery
  module Classworks
    class ClassworksController < ::ApplicationController

      before_filter :find_all_classworks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @classwork in the line below:
        present(@page)
      end

      def show
        @classwork = Classwork.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @classwork in the line below:
        present(@page)
      end

    protected

      def find_all_classworks
        @classworks = Classwork.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/classworks").first
      end

    end
  end
end
