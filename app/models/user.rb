class User < ActiveRecord::Base
  has_many :pushup_reminders
  
  attr_accessible :email, :username
end
