class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(search)
      where("age LIKE ? OR breed LIKE ? OR size LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
   end
end
