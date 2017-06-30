class Product < ActiveRecord::Base
  validates :name, :presence => true
    validates :cost, :presence => true
      validates :country, :presence => true
end
