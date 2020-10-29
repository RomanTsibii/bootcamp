class FlowStep < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :development_plan

  validates :title, presence: true
end
