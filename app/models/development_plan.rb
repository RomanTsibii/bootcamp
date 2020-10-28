class DevelopmentPlan < ApplicationRecord
  belongs_to :department
  has_many :flow_steps
  validates :title, presence: true
end
