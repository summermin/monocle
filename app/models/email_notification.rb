class EmailNotification < ActiveRecord::Base
  validates :email, :project_id, presence: true

  def notify
    puts "send an email"
  end
end