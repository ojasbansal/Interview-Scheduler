class User < ApplicationRecord 
  has_many :interview_users, dependent: :destroy
  has_many :interviews, through: :interview_users, dependent: :destroy 
end
