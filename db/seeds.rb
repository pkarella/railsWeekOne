Product.destroy_all
Review.destroy_all

50.times do |index|
  f = Product.create!(
        name: Faker::HarryPotter.name,
        cost: Faker::Number.decimal(2),
        country: Faker::Address.country
      )
  5.times do |index|
    Review.create!(
      author: Faker::GameOfThrones.character,
      description: Faker::Lorem.characters(55),
      rating: Faker::Number.between(1, 5),
      product_id: f.id
    )
  end
end


p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
