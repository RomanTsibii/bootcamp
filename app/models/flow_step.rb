class FlowStep < ApplicationRecord
  belongs_to :development_plan
  has_many :tasks
end
