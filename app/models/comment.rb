class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :commentable, polymorphic: true

  has_rich_text :content

  validates :content, presence: true
end
