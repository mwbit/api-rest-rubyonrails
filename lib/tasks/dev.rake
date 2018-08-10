namespace :dev do
  desc "Configure development env"
  task setup: :environment do

    puts "Reseting database"
    %x(rails db:drop db:create db:migrate)


    puts "Adding Kinds"
    kinds = %w(Friend, Work, Family)
    
    kinds.each do |kind|
      puts kind
      Kind.create!(description: kind)
    end
    
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago,18.years.ago),
        kind: Kind.all.sample
      )
    end

    #phones
    puts 'Adding Phones'

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    #Addresses
    puts 'Adding Addresses'

    Contact.all.each do |contact|
        address = Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
    end

  end
end
