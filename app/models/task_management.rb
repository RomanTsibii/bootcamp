class TaskManagement < ApplicationRecord
  belongs_to :user
  belongs_to :task

  enum state: {
    pending: 0,
    in_progress: 1,
    done: 2
  }
end
