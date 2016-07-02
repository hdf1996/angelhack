require "ffaker"

ActiveRecord::Base.transaction do
  Event.destroy_all

  12.downto(1).each do |i|
    date = Time.now - i.days

    Event.create!(
      event_type: ["health", "productivity"].sample,
      name: ["sleep","sexy_time", "work", "run", "walk"].sample,
      date: Time.new(
        date.year,
        date.month,
        date.day,
       rand(20..23)
      ),
      metadata: { duration: rand((60*5)..(60*10)) }
    )

    did_fuck = rand(1..3) == 1

    Event.create!(
      event_type: "health",
      name: "sexy_time",
      date: Time.new(
        date.year,
        date.month,
        date.day,
       rand(0..23)
      ),
      metadata: { duration: rand(10..45) }
    ) if did_fuck
  end
end
