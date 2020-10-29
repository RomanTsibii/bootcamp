class FlowStep < ApplicationRecord
  belongs_to :development_plan
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
