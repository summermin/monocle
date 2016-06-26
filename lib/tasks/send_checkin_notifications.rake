task send_checkin_notifications: :environment do
  day_of_week = Date.today.strftime("%A")
  projects = Project.active.for_day_and_hour(day_of_week, DateTime.now.hour)

  projects.each do |project|
    checkin = project.create_checkin
    project.send_notifications(checkin)
  end
end