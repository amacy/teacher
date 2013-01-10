
FactoryGirl.define do
  factory :classwork, :class => Refinery::Classworks::Classwork do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

