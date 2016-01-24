require 'faker'

# Create Posts 

50.times do 
  title = Faker::Lorem.sentence
  post_body = Faker::Lorem.paragraph
  if !Post.exists?(title: title, body: post_body)  
    Post.create!(
      title: title,
      body: post_body
      )
  end
end

posts = Post.all

# Create Comments
100.times do
  post = posts.sample
  comment_body = Faker::Lorem.paragraph
  if !Comment.exists?(post: post, body: comment_body)  
    Comment.create!(
      post: post,
      body: comment_body
  )
  end
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
