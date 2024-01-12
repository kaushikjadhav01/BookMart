# Transaction model represents the whole current transaction at any time. It has multiple transaction items which are the orders added to the cart.
class Transaction < ApplicationRecord
    has_many :transaction_items
    before_save :set_total_price
    before_save :set_quantity

    def total_price
        transaction_items.collect{|transaction_item| transaction_item.unit_price*transaction_item.quantity}.sum
    end

    def quantity
        transaction_items.collect{|transaction_item| transaction_item.quantity}.sum
    end
    
    # This is a helper method to get the names of the books purchased in this transaction so that we can display it on Transaction History page
    def purchased_books 
        book_ids = transaction_items.collect(&:book_id)
        Book.where(id: book_ids).collect(&:name)
    end

    private

    def set_total_price
        self[:total_price] = total_price
    end

    def set_quantity
        self[:quantity] = quantity
    end
end
