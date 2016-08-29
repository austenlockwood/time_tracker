# Developer model
class Developer < ActiveRecord::Base
  has_many :time_logs, dependent: :restrict_with_error
  has_many :projects, through: :time_logs
  validates :email, uniqueness: true, presence: true
  has_secure_password

  def time_entered_in_current_week
    # TimeLog.where(developer_id: id)# will add date stuff
    time_logs.where(date: Date.today.all_week).map do |time_log|
      time_log.minutes
    end.sum
  end

  # before_destroy :cannot_delete_developers_with_time_entered
  #
  # def cannot_delete_developers_with_time_entered
  #   errors.add(:base, 'You cannot delete a developer who has entered time') if time_logs.any?
  #
  #   # If rails 5 replace `false` with `throw(:abort)`
  #   false if errors.present?
  # end

end
