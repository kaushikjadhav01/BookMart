class Review < ApplicationRecord
    after_destroy :destroy_callback

    belongs_to :book
    belongs_to :user

    validates_presence_of :rating, :review

    validates :rating, inclusion: { in: 1..5, message: 'The rating must be between 1 and 5' }
    validates :review, :length => { :minimum => 10 }

    def destroy_callback
        puts "Review #{self.id} was destroyed"
    end
end
