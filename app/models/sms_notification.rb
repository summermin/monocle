class SMSNotification < ActiveRecord::Base
  validates :phone_number, :project_id, presence: true

  def notify
    puts "send an sms"
  end
end