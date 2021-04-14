User.destroy_all
Character.destroy_all

(1..15).each do |id|
    User.create!(
       username: Faker::JapaneseMedia::Naruto.character,
       password_digest: "#{User.digest('Password')}"
   
    )
end

(1..5).each do |id|
    Character.create!( # this is my model name, creating these instances
       name: Faker::TvShows::BojackHorseman.character,
       gender: ['female', 'male'].sample,
       animal?: [true, false].sample, # will sample either true or false
       depressed?: [true, false].sample
       user_id: rand(1..15)    
    )
end