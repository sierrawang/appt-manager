class Appointment < ApplicationRecord
  belongs_to :user
  default_scope -> { order(appt_time: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
end
