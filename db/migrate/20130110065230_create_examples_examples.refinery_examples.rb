# This migration comes from refinery_examples (originally 1)
class CreateExamplesExamples < ActiveRecord::Migration

  def up
    create_table :refinery_examples do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-examples"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/examples/examples"})
    end

    drop_table :refinery_examples

  end

end
