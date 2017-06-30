class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
end
