require "ffaker"

12.downto(1).each do |i|
  date = Time.now - i.days

  Event.create!(
    event_type: "health",
    name: "sleep",
    date: Time.new(
      date.year,
      date.month,
      date.day,
     rand()
    )
  )
end
