class Department < ApplicationRecord
  has_many :users
  has_one_attached :image
  validates :title, presence: true
end
