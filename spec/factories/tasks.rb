FactoryBot.define do
  factory :task do
    title { 'title' }
    level { 1 }
    flow_step
    development_plan
  end
end
