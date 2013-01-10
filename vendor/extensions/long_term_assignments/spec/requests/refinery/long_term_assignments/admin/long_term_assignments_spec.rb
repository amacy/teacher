# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "LongTermAssignments" do
    describe "Admin" do
      describe "long_term_assignments" do
        login_refinery_user

        describe "long_term_assignments list" do
          before do
            FactoryGirl.create(:long_term_assignment, :title => "UniqueTitleOne")
            FactoryGirl.create(:long_term_assignment, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.long_term_assignments_admin_long_term_assignments_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.long_term_assignments_admin_long_term_assignments_path

            click_link "Add New Long Term Assignment"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::LongTermAssignments::LongTermAssignment.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::LongTermAssignments::LongTermAssignment.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:long_term_assignment, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.long_term_assignments_admin_long_term_assignments_path

              click_link "Add New Long Term Assignment"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::LongTermAssignments::LongTermAssignment.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:long_term_assignment, :title => "A title") }

          it "should succeed" do
            visit refinery.long_term_assignments_admin_long_term_assignments_path

            within ".actions" do
              click_link "Edit this long term assignment"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:long_term_assignment, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.long_term_assignments_admin_long_term_assignments_path

            click_link "Remove this long term assignment forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::LongTermAssignments::LongTermAssignment.count.should == 0
          end
        end

      end
    end
  end
end
