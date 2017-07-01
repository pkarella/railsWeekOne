class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :name, length: { maximum: 50 }
  validates :cost, :presence => true
  validates :country, :presence => true
  validates :country, length: { maximum: 50 }

  scope :most_reviews, -> {(
      select("products.id, products.name, count(reviews.id) as reviews_count")
      .joins(:reviews)
      .group('products.id')
      .order('reviews_count DESC')
      .limit(2)
    )}
scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

scope :us_products, -> {
   where("country like ?", "USA")
 }
end
