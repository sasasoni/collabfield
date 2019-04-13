# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  10.times do
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@text.com",
      password: 'password',
      password_confirmation: 'password'
    )
    user_id += 1
  end
end

def seed_categories
  hobby = %w(Arts Crafts Sports Sciences Collecting Reading Other)
  study = %w(Arts\ and\ Humanities Data\ Science Economics\ and\ Finance Business Social\ Sciences Language Other)
  team = %w(Study Development Arts\ and\ Hobby Other)

  hobby.each do |name|
    Category.create(branch: 'hobby', name: name)
  end

  study.each do |name|
    Category.create(branch: 'study', name: name)
  end

  team.each do |name|
    Category.create(branch: 'team', name: name)
  end
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0],
        content: Faker::Lorem.sentences[0],
        user_id: rand(1..9),
        category_id: category.id
      )
    end
  end
end

puts "seeding..."
seed_users
seed_categories
seed_posts
puts "done"