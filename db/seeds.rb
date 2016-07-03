require "ffaker"

ActiveRecord::Base.transaction do
  #Event.destroy_all

  120.downto(1).each do |i|
    date = Time.now - i.days

    Event.create!(
      name: "sleep",
      date: Time.new(
        date.year,
        date.month,
        date.day,
        rand(20..23)
      ),
      value: rand(30..120)
    )

    Event.create!(
      name: "run",
      date: Time.new(
        date.year,
        date.month,
        date.day,
        rand(7..23)
      ),
      value: rand(30..120)
    ) if [6,0].include?(date.wday)

    Event.create!(
      name: "work",
      date: Time.new(
        date.year,
        date.month,
        date.day,
        rand(7..11)
      ),
      value: rand(5..9)
    ) if (1..5) === date.wday

    Event.create!(
      name: "social",
      date: Time.new(
        date.year,
        date.month,
        date.day,
       rand(0..23)
      ),
      value: rand(10..45)
    ) if did_fuck = rand(1..3) == 1

    email = FFaker::Internet.email
    User.create(
      uid: email,
      email: email,
      password: FFaker::Internet.password
    )
  end
end
