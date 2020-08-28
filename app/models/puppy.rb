class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(term)
      where("age ILIKE ?", "%#{term}%").or(where("breed ILIKE ?", "%#{term}%")).or(where("size ILIKE ?", "%#{term}%"))
   end
end
