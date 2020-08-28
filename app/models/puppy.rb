class Puppy < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def self.search(search)
      where("age ILIKE ? OR breed ILIKE ? OR size ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")
   end
end
