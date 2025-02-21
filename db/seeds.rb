Event.destroy_all
Invitation.destroy_all
Item.destroy_all
User.destroy_all

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email(name: "#{first_name}.#{last_name}")
    user = User.new(email: email, first_name: first_name, last_name: last_name)
    user.password = "123456"
    user.phone_number = Faker::PhoneNumber.cell_phone_in_e164
    user.save!

    10.times do
        event = Event.new(user: user)
        event.scheduled_at = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
        event.title = Faker::Lorem.words(number: 2).join(' ').truncate(20)
        event.location = Faker::Address.street_address
        event.description = 'sdfasdfsdfasdfa'
        event.save!
    end

    10.times do
        event = Event.all.sample
        name = Faker::Food.ingredient
        item = Item.new(name: name)
        item.event = event
        item.save!
    end
end

User.all.each do |user|
    10.times do
        event = Event.all.sample
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        receiver = User.where.not(id: user.id).sample
        email = Faker::Internet.email(name: "#{first_name}.#{last_name}")
        status = ['pending', 'accepted'].sample
        invitation = Invitation.new(event: event, sender: user, receiver: receiver, receiver_email: email, status: status)
        invitation.save!
    end
end



