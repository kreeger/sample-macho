namespace :pushup_reminders do
  desc "create some (4) reminders"
  task :generate => :environment do
    User.all.each do |user|
      pushups = []
      unless user.nil?
        4.times do
          pushups << user.pushup_reminders.create(:completed => false, :num_pushups => user.pushups_per_reminder, :when_sent => Time.now)
        end
      end
      puts "#{pushups.length} pushups created for #{user.username}."
    end
  end
end
