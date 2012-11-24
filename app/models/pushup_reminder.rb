class PushupReminder < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :completed, :num_pushups, :when_sent, :user_id
end
