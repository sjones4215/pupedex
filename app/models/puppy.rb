class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(term)
      where("age LIKE ?", "%#{term.to_i}%").or(where("breed LIKE ?", "%#{term}%")).or(where("size LIKE ?", "%#{term}%"))
   end
end