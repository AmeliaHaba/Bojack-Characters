(1..15).each do |id|
    User.create!(
       username: Faker::Internet.username,
       password_digest: "#{User.digest('Password')}"
   
       # password: "Password")
    )
end

(1..45).each do |id|
    Character.create!( # this is my model name, creating these instances
       name: Faker::TvShows::BojackHorseman.character,
       animal?: [true, false].sample, # will sample either true or false
       user_id: rand(1..15)    
    )
end