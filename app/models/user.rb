class User < ActiveRecord::Base
  has_many :pushup_reminders
  
  attr_accessible :email, :username

  def pushups_per_reminder
    Random.rand(10)
  end
end
