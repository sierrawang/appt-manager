class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
  default_scope -> { order(:created_at) }
  validates :user_id, presence: true
  validates :appointment_id, presence: true
  validates :content, presence: true
end
