
FactoryGirl.define do
  factory :homework, :class => Refinery::Homeworks::Homework do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

