# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan do
    amount 1
    term 1
    coupon 1.5
  end
end
