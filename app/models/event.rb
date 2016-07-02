class Event < ApplicationRecord
  validates :name, :date, :value, presence: true

  scope :relative_to, -> date do
    where date: (date-6.hours)..(date+6.hours)
  end
end
