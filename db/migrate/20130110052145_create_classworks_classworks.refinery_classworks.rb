# This migration comes from refinery_classworks (originally 1)
class CreateClassworksClassworks < ActiveRecord::Migration

  def up
    create_table :refinery_classworks do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-classworks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/classworks/classworks"})
    end

    drop_table :refinery_classworks

  end

end
