class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

  # List items currently added to cart. Transcation reperesents the whole transaction. A Transaction item is each item in the cart.
  def show
    @transaction = current_transaction
    @transaction_items = @transaction.transaction_items
  end
end
