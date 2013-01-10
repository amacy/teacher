module Refinery
  module Examples
    class ExamplesController < ::ApplicationController

      before_filter :find_all_examples
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @example in the line below:
        present(@page)
      end

      def show
        @example = Example.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @example in the line below:
        present(@page)
      end

    protected

      def find_all_examples
        @examples = Example.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/examples").first
      end

    end
  end
end
