# project model
class Project < ActiveRecord::Base
  has_many :time_logs, dependent: :restrict_with_error
  has_many :developers, through: :time_logs
  validates :name, uniqueness: true, presence: true
  validates_numericality_of :max_minutes, greater_than: 119, message: '| Projects must allow a minimum of two hours.'

  def sum_of_time_entered
    # TimeLog.where(project_id: id)
    time_logs.map do |time_log|
      time_log.minutes
    end.sum # => []

    # Extract values of a column, and then sum
    # time_logs.pluck(:minutes).sum

    # Have the DB sum values of a column (records must be saved)
    # time_logs.sum(:minutes)
  end

end
