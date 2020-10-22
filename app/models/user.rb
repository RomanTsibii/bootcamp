class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum level: {
      trainee: 0,
      junior: 1,
      middle: 5,
      senior: 10
  }
  has_one_attached :avatar

  enum role:{
      member: 0,
      admin: 100
  }

  belongs_to :department
end
