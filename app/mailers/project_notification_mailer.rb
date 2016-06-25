class ProjectNotificationMailer < ActionMailer::Base
  default from: 'no-reply@monocleprojects.com'

  def checkin_email(to_address:)
    category 'checkin_notification'
    mail(to: to_address, subject: '[Monocle] Did you complete your goal today?')
  end
end