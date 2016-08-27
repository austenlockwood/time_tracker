# TimeLog Model
class TimeLog < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
  validates :project_id, presence: true
  validates_numericality_of :minutes, greater_than: 14, message: '| You must enter at least one increment of fifteen minutes.'
end
