class TimeEntry < ApplicationRecord
  belongs_to :project
  validates :hours, presence: true
end
