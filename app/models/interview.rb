class Interview < ApplicationRecord
  has_many :interview_users
  has_many :users, through: :interview_users 
end
