class Book < ApplicationRecord
    has_many :transaction_items
    has_many :reviews, dependent: :destroy
    validates_presence_of :name, :author, :publisher, :price, :stock

    validates :price, numericality: { greater_than: 0 }
    validates :stock, numericality: { greater_than_or_equal_to: 0 }

    def average_rating
        reviews.where(book_id: self.id).average(:rating)
    end
end
