# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
Comment.destroy_all


50.times do
    alphabet = "a".."z"
    random_title = alphabet.to_a.shuffle.join
    random_body = alphabet.to_a.shuffle.join * 2
    
    p = Post.create(
        title: random_title,
        body: random_body,
        user_id: 7
        if p.valid?
            )
        rand(1..5).times do
            Comment.create(body: random_title, post: p, user_id: 8)
        end
    end

end

posts = Post.all
comments = Comment.all
puts "generated #{posts.count} posts"
puts "generated #{comments.count} comments"
