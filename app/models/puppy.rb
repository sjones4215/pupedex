class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(search)
      where("age ILIKE ?", "%#{search}%") 
      where("breed ILIKE ?", "%#{search}%")
      where("size ILIKE ?", "%#{search}%")
    end
    
end
