class CorrelationCalculator
  attr_accessor :event_type, :event_name, :all_event_types_and_names

  def initialize(event_type, event_name)
    self.event_type = event_type
    self.event_name = event_name

    self.all_event_types_and_names =
      Event
        .where.not(
          event_type: event_type,
          name: event_name,
        )
        .pluck(:event_name, :name)
  end

  def calculate
    self.all_event_types_and_names.map do |event_type, name|
      calculate_correlaction(event_type, name)
    end
  end

  def calculate_correlation(event_type, name)
    events = Event.where(event_type: event_type, name: name)
  end
end
