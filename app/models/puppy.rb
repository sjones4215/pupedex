class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(search)
      where("age LIKE ?", "%#{search}%") 
      where("breed LIKE ?", "%#{search}%")
    end
    
end
