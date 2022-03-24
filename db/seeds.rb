# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all

50.times do
    alphabet = "a".."z"
    random_title = alphabet.to_a.shuffle.join
    random_body = alphabet.to_a.shuffle.join * 2
    
    Post.create(
        title: random_title,
        body: random_body,

    )

end

posts = Post.all

puts "generated #{posts.count} posts"