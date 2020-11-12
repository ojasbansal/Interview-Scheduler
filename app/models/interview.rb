class ModelValidator < ActiveModel::Validator
  def validate(record)
    return if record.starttime == nil || record.endtime == nil

    if record.starttime > record.endtime
      record.errors[:base] << "Interview Endtime should be after Start time"
    end

    if record.starttime < Time.now
      record.errors[:base] << "Interview Must be Scheduled for the future."
    end

    # Maximum Time Limit is 5 hours, can update accordingly
    if record.endtime - record.starttime > 18000
      record.errors[:base] << "Maximum Interview Duration allowed is 5 hours."
    end

    if !(checkUsersCount record)
      record.errors[:base] << "Number of users must be greater than 2."
    end

    if clash record
      record.errors[:base] << "Some participants are busy in this time slot."
    end
  end

  private
  def checkUsersCount(obj)
    if obj.users.length >= 2
      return true
    else
      return false
    end
  end

  def clash(obj)
    usersArr = obj.users
    l = obj.starttime
    r = obj.endtime
    usersArr.each do |user|
      obj2 = user.interviews
      obj2.each do |interview|
        if interview.id == obj.id || interview.starttime > r || interview.endtime < l
          next
        else
          return true
        end
      end
    end
    return false
  end

end

class Interview < ApplicationRecord
  has_many :interview_users, dependent: :destroy
  has_many :users, through: :interview_users, dependent: :destroy
  validates :starttime, :endtime, presence: true
  validates_with ModelValidator
end
