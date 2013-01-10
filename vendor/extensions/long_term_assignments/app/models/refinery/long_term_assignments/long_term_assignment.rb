module Refinery
  module LongTermAssignments
    class LongTermAssignment < Refinery::Core::BaseModel
      self.table_name = 'refinery_long_term_assignments'

      attr_accessible :title, :date, :photo_id, :copy, :file_id, :position

      acts_as_indexed :fields => [:title, :copy]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      belongs_to :file, :class_name => '::Refinery::Resource'
    end
  end
end
