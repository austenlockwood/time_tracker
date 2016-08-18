class Developer < ActiveRecord::Base
belongs_to :time_log
has_and_belongs_to_many :projects
end
