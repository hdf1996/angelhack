class Event < ApplicationRecord
  validates :event_type, :name, presence: true
end
