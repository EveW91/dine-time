# Clear existing data
Reservation.destroy_all
Review.destroy_all
Restaurant.destroy_all
User.destroy_all

# Create Users
users = []
5.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "password123"
  )
end

puts "✅ Created #{users.count} users."

# Create Restaurants
restaurants = []
5.times do |i|
  restaurants << Restaurant.create!(
    name: ["Sakura Sushi", "Bella Italia", "Grill House", "Tandoori Nights", "La Parisienne"][i],
    cuisine: ["Japanese", "Italian", "Steakhouse", "Indian", "French"][i],
    user: users.sample,
    opening_time: "10:00 AM",
    closing_time: "10:00 PM",
    street_address: "#{rand(1..100)} Main St",
    city: "Sample City",
    postcode: "12345",
    county: "Sample County"
  )
end

puts "✅ Created #{restaurants.count} restaurants."

# Create Reservations
reservations = []
10.times do
  reservations << Reservation.create!(
    restaurant: restaurants.sample,
    user: users.sample,
    date: Faker::Date.forward(days: 30),
    time: "#{rand(5..9)}:00 PM",
    status: ["confirmed", "pending", "cancelled"].sample,
    party_size: rand(1..6)
  )
end

puts "✅ Created #{reservations.count} reservations."

# Create Reviews
reviews = []
10.times do
  reviews << Review.create!(
    user: users.sample,
    restaurant: restaurants.sample,
    rating: rand(1..5),
    comment: Faker::Restaurant.review
  )
end

puts "✅ Created #{reviews.count} reviews."
