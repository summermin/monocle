class ProjectNotificationMailer < ActionMailer::Base
  default from: "no-reply@monocleprojects.com"

  def checkin_email(to_address:, checkin:)
    @checkin = checkin
    category "checkin_notification"
    mail(to: to_address, subject: "[Monocle] Did you complete your #{checkin.project.project_type} goal today?")
  end
end