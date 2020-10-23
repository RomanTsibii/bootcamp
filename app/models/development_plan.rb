class DevelopmentPlan < ApplicationRecord
  belongs_to :department

  validates :title, presence: true
end
