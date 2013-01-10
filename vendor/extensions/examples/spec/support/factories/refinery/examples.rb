
FactoryGirl.define do
  factory :example, :class => Refinery::Examples::Example do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

