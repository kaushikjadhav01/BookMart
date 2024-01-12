class TransactionItemsController < ApplicationController
    before_action :authenticate_user!

    # For easy understanding of custom instance variables, pls refer below:
    # old_quantity = quantity of transaction item currently in the cart. 0 if the item is new and not in cart till now. If item already present in cart, this is initiated to that item's quantity in cart.
    # quantity = quantity of transaction item that the user sends in this request
    # stock =  stock of book after adding book to cart
    # We use the formula old_quantity + stock - quantity to calculate the stock of the book after the book is added to cart.
    # old_stock = stock of book before the book was added to cart. Suppose user adds a book to the cart, but then removes it from the cart. In this case, we want to update the stock of the book to the old_stock value. This is done in the set_subtotal method in TransactionItem model.
    # Instead of using locks, we have used above two extra "old_" variables and their formulae to handle race conditions as given in TransactionItem model.

    def create
        @transaction = current_transaction
        # Handle the case where the user adds the same book twice. Example: User adds 1 book, then adds the same book again. We want to update the quantity of the existing item instead of creating a new item.
        existing_item = @transaction.transaction_items.select { |transaction_item| transaction_item['book_id']== transaction_params['book_id'].to_i && transaction_item['user_id'] == transaction_params['user_id'].to_i }
        unless existing_item.empty?
            existing_item.each do |item|
                @transaction_item = @transaction.transaction_items.find(item[:id])
                # quantity and stock get changed during update or save. So take backup of old values and validate in TransactionItem model.
                @transaction_item.old_quantity = @transaction_item.quantity
                @transaction_item.old_stock = @transaction_item.book.stock
                params = transaction_params
                params[:quantity] = params[:quantity].to_i + @transaction_item.quantity.to_i
                @transaction_item.update(params)
            end
        else
            @transaction_item = @transaction.transaction_items.new(transaction_params)
            @transaction_item.old_quantity = 0
            @transaction_item.old_stock = @transaction_item.book.stock
            @transaction.save
        end
        session[:transaction_id] = @transaction.id
        # To store errors and render error details in views
        if @transaction.valid?
            session[:errors] = []
        else
            session[:errors] = [@transaction_item.book.id, @transaction_item.book.name, @transaction_item.book.stock]
        end
        redirect_to shops_path
    end

    def update
        @transaction = current_transaction
        @transaction_item = @transaction.transaction_items.find(params[:id])
        @transaction_item.old_quantity = @transaction_item.quantity
        @transaction_item.old_stock = @transaction_item.book.stock
        @transaction_item.update(transaction_params)
        if @transaction_item.valid?
            session[:errors] = []
        else
            session[:errors] = [@transaction_item.book.id, @transaction_item.book.name, @transaction_item.book.stock]
        end
        @transaction_items = current_transaction.transaction_items
        redirect_to carts_path
    end

    def destroy
        @transaction = current_transaction
        @transaction_item = @transaction.transaction_items.find(params[:id])
        # If the user removes whole transaction item from the cart, update stock
        @transaction_item.book.update(stock: (@transaction_item.book.stock + @transaction_item.quantity))
        session[:errors] = []
        @transaction_item.destroy
        @transaction_items = current_transaction.transaction_items
        redirect_to carts_path
    end

    private

    def transaction_params
        params.require(:transaction_item).permit(:book_id, :user_id, :quantity)
    end
end
