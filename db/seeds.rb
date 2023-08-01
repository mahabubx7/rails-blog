# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create(name: 'Mahabub', bio: 'developer', posts_counter: 0)
u2 = User.create(name: 'Prince', bio: 'developer', posts_counter: 0)

p1 = Post.create(author: u1, title: 'post 1', text: 'post text', comments_counter: 0, likes_counter: 0)
p2 = Post.create(author: u1, title: 'post 2', text: 'post text', comments_counter: 0, likes_counter: 0)
p3 = Post.create(author: u1, title: 'post 3', text: 'post text', comments_counter: 0, likes_counter: 0)

c1 = Comment.create(author: u2, post: p1, text: 'nice post!')
