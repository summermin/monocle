task send_checkin_notifications: :environment do
  day_of_week = Date.today.strftime("%A")
  projects = Project.active.for_day_and_time(day_of_week, DateTime.now.hour)

  projects.each do |project|
    project.send_notifications
  end
end