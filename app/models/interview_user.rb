class InterviewUser < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :interview, dependent: :destroy
end
