class User < ApplicationRecord 
  has_many :interview_users
  has_many :interviews, through: :interview_users 
end
