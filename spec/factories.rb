FactoryBot.define do
  # sequence :email do |n|
  #   "user#{n}@example.com"
  # end
  factory :user do
    name {"John"}
    password {"12345"}
    email { "#{name}@example.com" }
  end
end