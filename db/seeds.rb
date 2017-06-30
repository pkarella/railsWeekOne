Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::HarryPotter.character,
                        cost: Faker::Number.positive,
                        country: Faker::Lorem.sentence(20, false, 0))
end


p "Created #{Product.count} "
