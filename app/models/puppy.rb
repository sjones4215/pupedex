class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(search)
      where("age ILIKE ?", "%#{search}%").or(where("breed ILIKE ?", "%#{search}%")).or(where("size ILIKE ?", "%#{search}%"))
   end
end
