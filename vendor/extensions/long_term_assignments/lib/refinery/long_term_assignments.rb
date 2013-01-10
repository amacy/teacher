require 'refinerycms-core'

module Refinery
  autoload :LongTermAssignmentsGenerator, 'generators/refinery/long_term_assignments_generator'

  module LongTermAssignments
    require 'refinery/long_term_assignments/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
