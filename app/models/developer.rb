class Developer < ActiveRecord::Base
  has_many :time_logs
  has_many :projects, through: :time_logs
  validates :email, uniqueness: true, presence: true
  has_secure_password

end
