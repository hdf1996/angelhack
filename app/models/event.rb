class Event < ActiveRecord::Base
  validates :name, :date, :value, presence: true

  scope :created_between, ->(from, to) {where('date > ? AND date < ?', from, to)}
  scope :by_user_id, -> (user_id) {where(user_id: user_id)}
  scope :relative_to, -> date { where date: (date-24.hours)..(date+24.hours) }
end
