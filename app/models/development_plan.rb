class DevelopmentPlan < ApplicationRecord
  belongs_to :department
  has_many :flow_steps, dependent: :destroy
  validates :title, presence: true
end
