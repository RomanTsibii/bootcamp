FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { '123456789' }
    department
    role { 100 }
  end
end
