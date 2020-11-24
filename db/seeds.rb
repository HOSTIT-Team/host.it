Event.destroy_all
Invitation.destroy_all
Item.destroy_all
User.destroy_all


10.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.safe_email(name: "#{first_name}.#{last_name}")
    user = User.new(email: email, first_name: first_name, last_name: last_name)
    user.password = "123456"
    user.phone_number = Faker::PhoneNumber.cell_phone_in_e164
    user.save!


    10.times do
        event = Event.new(user: user)
        event.time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
        event.title = Faker::Hipster.sentence(word_count: rand(3))
        event.location = Faker::Address.street_address
        event.description = 'sdfasdfsdfasdfa'
        event.save!
    end

    10.times do
        event = Event.all.sample
        item = Item.new
        item.event = event
        item.user = User.all.sample
        item.save!
    end
end

User.all.each do |user|
    10.times do 
        event = Event.all.sample
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        receiver = User.where.not(id: user.id).sample
        email = Faker::Internet.safe_email(name: "#{first_name}.#{last_name}") 
        invitation = Invitation.new(event:event, sender: user, receiver: receiver, receiver_email: email, status: 'invited' )
        invitation.save!
    end
end



