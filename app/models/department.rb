class Department < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :development_plans, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
end
