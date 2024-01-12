# Represents each item added to the cart
class TransactionItem < ApplicationRecord
    belongs_to :my_transaction, class_name: 'Transaction', foreign_key: 'transaction_id', required: false
    belongs_to :book
    belongs_to :user

    validate :validate_book_stock

    before_save :set_unit_price
    before_save :set_subtotal

    attr_accessor :old_quantity, :old_stock

    def unit_price
        if persisted?
            self[:unit_price]
        else
            book.price
        end
    end

    def subtotal
        unit_price*quantity
    end

    private

    def validate_book_stock
        # Check Transaction Items controller for meaning of below variables. We use formula old_quantity + stock - quantity to update stock. If this result is negative or if after removing the book from the cart, the quantity is not equal to the old quantity, then the book is out of stock and we show error.
        if  (self.old_quantity + self.book.stock - self.quantity) < 0 && self.old_stock + self.old_quantity != self.quantity
            self.errors.add(:book, :invalid)
        end
    end

    def set_unit_price
        self[:unit_price] = unit_price 
    end

    def set_subtotal
        # If user changes the quantity of the book from cart page, update the stock of the book.
        self.book.update(stock: (self.old_quantity + self.book.stock - self.quantity))
        self[:subtotal] = subtotal * quantity
    end
end
