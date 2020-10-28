class Task < ApplicationRecord
  belongs_to :flow_step
  has_many :task_managements
  has_many :users, :through => :task_managements

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
