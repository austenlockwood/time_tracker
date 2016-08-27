class Project < ActiveRecord::Base
  has_many :time_logs
  has_many :developers, through: :time_logs
  validates :name, uniqueness: true, presence: true
  
end
