# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'

data = JSON.parse(File.read('./sample.json'))

data.each do |story_data|
  story = Story.create!(
    title: story_data['title'],
    url: story_data['url'],
    description: story_data['description'],
    upvotes: story_data['likes'],
    user_name: story_data['by']
  )
  
#   story_data['comments'].each do |comment_data|
#     story.comments.create!(
#       content: comment_data['content'],
#       user_name: comment_data['user_name']
#     )
#  end
end
