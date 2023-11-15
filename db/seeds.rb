# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Restaurant.destroy_all

5.times do
  restaurant_info = {
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Faker::Restaurant.type,
    phone_number: Faker::PhoneNumber.phone_number
  }

  restaurant = Restaurant.create!(restaurant_info)

    3.times do
      review_info = {
        rating: rand(0..5),
        content: Faker::Restaurant.review
      }

      review = Review.new(review_info)
      review.restaurant_id = restaurant.id
      review.save
    end
end
