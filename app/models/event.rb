class Event < ApplicationRecord
  validates :event_type, :name, presence: true
  scope :created_between, ->(from, to) {where('date > ? AND date < ?', from, to)}
  scope :by_user_id, -> (user_id) {where(user_id: user_id)}
	
  validates :name, :date, :value, presence: true

  scope :relative_to, -> date do
    where date: (date-24.hours)..(date+24.hours)
  end
end
