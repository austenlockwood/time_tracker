class TimeLog < ActiveRecord::Base
has_many :developers
has_many :projects
end
