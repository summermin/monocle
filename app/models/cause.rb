class Cause < ActiveRecord::Base
  validates :name, presence: true
end