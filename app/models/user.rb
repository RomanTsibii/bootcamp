class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable

  has_many :task_managements, dependent: :destroy
  has_many :tasks, through: :task_managements
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :department

  has_one_attached :avatar

  enum level: {
    trainee: 0,
    junior: 1,
    middle: 5,
    senior: 10
  }

  enum role: {
    member: 0,
    admin: 100
  }

  validates :first_name, presence: true
  validates :last_name, presence: true
end
