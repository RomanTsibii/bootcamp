class Task < ApplicationRecord
  belongs_to :flow_step

  enum level: {
    trainee: 0,
    junior: 1,
    middle: 5,
    senior: 10
  }

  has_rich_text :description
end
