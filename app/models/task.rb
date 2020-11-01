class Task < ApplicationRecord
  has_many :task_managements, dependent: :destroy
  has_many :users, through: :task_managements
  has_many :comments, dependent: :destroy
  belongs_to :flow_step
  belongs_to :development_plan

  enum level: {
    trainee: 0,
    junior: 1,
    middle: 5,
    senior: 10
  }

  has_rich_text :description

  validates :title, presence: true
  validates :level, presence: true
end
