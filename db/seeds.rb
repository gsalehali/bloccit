require 'faker'

# Create Posts 

50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Creat Advertisements
10.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy:  Faker::Lorem.paragraph,
    price: Random.new.rand(1..5) * 9.99
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"