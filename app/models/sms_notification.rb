class SMSNotification < ActiveRecord::Base
  TWILIO_NUMBER = "+18329004235"

  validates :phone_number, :project_id, presence: true

  belongs_to :project

  has_many :notification_checkins, foreign_key: 'notification_id'
  has_many :checkins, through: :notification_checkins

  def notify(checkin)
    notification_checkin = notification_checkins.create!(checkin: checkin)

    SMSNotification.client.messages.create(
      from: TWILIO_NUMBER,
      to: phone_number,
      body: "Monocle Projects here with your #{Date.today.strftime("%A")} checkin. Was your #{project.project_type} goal a success? (Yes/No)"
    )
  end

  def self.client
    @client ||= Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
  end
end