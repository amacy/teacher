
FactoryGirl.define do
  factory :long_term_assignment, :class => Refinery::LongTermAssignments::LongTermAssignment do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

