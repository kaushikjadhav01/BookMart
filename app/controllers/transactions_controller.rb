class TransactionsController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :update]

  def index
    @user = current_user
    # Get Transaction history of user if all transactions are completed. If an incomplete transaction exists, then we want to show all transactions except the incomplete transaction.
    if session['transaction_id'].nil?
      @transactions = Transaction.joins(transaction_items: :user).where(users: {id: current_user.id}).distinct
    else
      @transactions = Transaction.joins(transaction_items: :user).where(users: {id: current_user.id}).distinct.where.not(id: session['transaction_id'].to_i)
    end
  end

  def update
    @transaction = current_transaction
    @transaction.update(transaction_params)
    current_user.update(phone_number: @transaction.phone_number, address: @transaction.address, credit_card_number: @transaction.credit_card_number)
    # Denote completion of current transaction by setting session['transaction_id'] to nil
    session['transaction_id'] = nil
    redirect_to transactions_url
  end

  private

  def transaction_params
      params.require(:transaction).permit(:total_price, :address, :credit_card_number, :phone_number)
  end
end
