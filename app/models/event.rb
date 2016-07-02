class Event < ApplicationRecord
  validates :event_type, :name, presence: true
  scope :created_between, ->(from, to) {where('date > ? AND date < ?', from, to)}
  scope :by_user_id, -> (user_id) {where(user_id: user_id)}
	
end
