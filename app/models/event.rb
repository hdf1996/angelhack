class Event < ApplicationRecord
  validates :name, :date, :value, presence: true

  scope :relative_to, -> date do
    where date: (date-24.hours)..(date+24.hours)
  end
end
