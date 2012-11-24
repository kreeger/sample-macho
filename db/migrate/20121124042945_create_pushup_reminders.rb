class CreatePushupReminders < ActiveRecord::Migration
  def change
    create_table :pushup_reminders do |t|
      t.boolean :completed
      t.integer :num_pushups
      t.datetime :when_sent

      t.timestamps
    end
  end
end
