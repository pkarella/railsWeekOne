class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :presence => true
  validates :author, length: { maximum: 50 }
  validates :description, :presence => true
  validates :description, length: { maximum: 50 }
  validates :rating, :presence => true

 scope :list, -> { where("rating >= 3") }


end
