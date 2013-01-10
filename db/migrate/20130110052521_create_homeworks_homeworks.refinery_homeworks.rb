# This migration comes from refinery_homeworks (originally 1)
class CreateHomeworksHomeworks < ActiveRecord::Migration

  def up
    create_table :refinery_homeworks do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-homeworks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/homeworks/homeworks"})
    end

    drop_table :refinery_homeworks

  end

end
