# This migration comes from refinery_long_term_assignments (originally 1)
class CreateLongTermAssignmentsLongTermAssignments < ActiveRecord::Migration

  def up
    create_table :refinery_long_term_assignments do |t|
      t.string :title
      t.datetime :date
      t.integer :photo_id
      t.text :copy
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-long_term_assignments"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/long_term_assignments/long_term_assignments"})
    end

    drop_table :refinery_long_term_assignments

  end

end
