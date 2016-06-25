task :send_checkin_notifications do
  day_of_week = Date.today.strftime("%A")

  projects = Project.
    joins(project_checkin_days: :checkin_day).
    where(checkin_days: { name: day_of_week }, checkin_hour: DateTime.now.hour)

  projects.each do |project|
    project.send_notification
  end
end