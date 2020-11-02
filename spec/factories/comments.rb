FactoryBot.define do
  factory :comment do
    content { 'title' }
    task
    association :commentable, factory: :user
  end
end
