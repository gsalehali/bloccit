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

#Create Questions
20.times do
  random = Random.new.rand(0..1)
  Question.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    resolved: random == 1
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"