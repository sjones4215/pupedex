class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(term)
      where("age LIKE ?", "%#{term}%").or(where("breed LIKE ?", "%#{term}%")).or(where("size LIKE ?", "%#{term}%"))
   end
end