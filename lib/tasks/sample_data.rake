namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do

    admin = User.create!(name: "Yokogi_Ken",
                         email: "yokogiKen@erev.com",
                         password: "yoko01",
                         password_confirmation: "yoko01",
                         admin: true)

    User.create!(name: "Yokogi",
                 email: "yokogi@erev.com",
                 password: "yoko01",
                 password_confirmation: "yoko01")

    15.times do |n|
      name  = Faker::Name.name
      email = "yokogi-#{n+1}@erev.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end


    users = User.all.limit(3)
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end

end