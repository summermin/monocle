class CheckinDay < ActiveRecord::Base
  validates :name, presence: true
end