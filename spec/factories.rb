FactoryBot.define do
  # sequence :email do |n|
  #   "user#{n}@example.com"
  # end

  # factory :user do
  #   name {"John"}
  #   password {"12345"}
  #   email { "#{name}@example.com" }
  # end

  factory :user do
    sequence(:email) { |n| "tester_#{n}@example.com" }
    sequence(:name) { |n| "tester_#{n}" }
    password { "pass123" }
    password_confirmation { "pass123" }
 end

end