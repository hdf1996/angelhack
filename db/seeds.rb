require "ffaker"
require "faker"
ActiveRecord::Base.transaction do
  Event.destroy_all

  12.downto(1).each do |i|
    date = Time.now - i.days

    Event.create!(
      name: ["sleep", "work", "run", "walk"].sample,
      date: Time.new(
        date.year,
        date.month,
        date.day,
        rand(20..23)
      ),
      value: rand(10..45)
    )

    did_fuck = rand(1..3) == 1

    Event.create!(
      name: "sexy_time",
      date: Time.new(
        date.year,
        date.month,
        date.day,
       rand(0..23)
      ),
      value: rand(10..45)
    ) if did_fuck

    email = Faker::Internet.email
    User.create(
      uid: email,
      email:email,
      password: Faker::Internet.password
    )

  end

end
