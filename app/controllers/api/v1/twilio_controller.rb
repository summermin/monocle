class Api::V1::TwilioController < Api::V1::BaseController
  def sms_response
    message_body = params["Body"].gsub(/\s+/, "").downcase
    from_number = params["From"]

    # Lookup notification by phone number, filtering out inactive projects
    notification = SMSNotification.joins(:project).where(phone_number: from_number).merge(Project.active).first

    # Lookup notified checkins
    checkin = notification.checkins.notified.first

    if !checkin.present?
      response_text = "I was unable to find an active project for this phone number. Please contact support if you think this is an error."
    elsif message_body == "yes"
      checkin.complete!
      response_text = "Woot! Good job, we will not charge your card this round. Keep up the great work \u1F601".encode("utf-8")
    elsif message_body == "no"
      checkin.fail!
      response_text = "Bummer. Well, at least it's going to a good cause. Your card will be charged #{} within the next few days"
    else
      response_text = "I'm not sure what you mean, please let me know if you achieved your goal today. (Yes/No)"
    end

    sms = SMSNotification.client.messages.create(
      from: SMSNotification::TWILIO_NUMBER,
      to: from_number,
      body: response_text
    )
  end
end