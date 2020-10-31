FactoryBot.define do
  factory :task_management do
    user
    task
    state { 0 }
  end
end
