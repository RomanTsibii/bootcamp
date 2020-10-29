class DevelopmentPlan < ApplicationRecord
  has_many :flow_steps, dependent: :destroy
  belongs_to :department

  validates :title, presence: true
end
