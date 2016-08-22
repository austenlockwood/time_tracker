class Developer < ActiveRecord::Base
has_many :time_logs
has_many :projects, through: :time_logs

end
