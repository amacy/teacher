# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Classworks" do
    describe "Admin" do
      describe "classworks" do
        login_refinery_user

        describe "classworks list" do
          before do
            FactoryGirl.create(:classwork, :title => "UniqueTitleOne")
            FactoryGirl.create(:classwork, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.classworks_admin_classworks_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.classworks_admin_classworks_path

            click_link "Add New Classwork"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Classworks::Classwork.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Classworks::Classwork.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:classwork, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.classworks_admin_classworks_path

              click_link "Add New Classwork"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Classworks::Classwork.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:classwork, :title => "A title") }

          it "should succeed" do
            visit refinery.classworks_admin_classworks_path

            within ".actions" do
              click_link "Edit this classwork"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:classwork, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.classworks_admin_classworks_path

            click_link "Remove this classwork forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Classworks::Classwork.count.should == 0
          end
        end

      end
    end
  end
end
