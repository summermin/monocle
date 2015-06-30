class Project < ActiveRecord::Base
  belongs_to :user
  has_many :check_ins
  accepts_nested_attributes_for :check_ins
end
