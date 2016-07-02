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
       rand()
      ),
      metadata: { duration: rand(5..10) }
    )
  end
end
