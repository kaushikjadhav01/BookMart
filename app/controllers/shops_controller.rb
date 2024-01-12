class ShopsController < ApplicationController
  before_action :authenticate_user!, :only => [:show, :index]

  def index
    @books = Book.all
    # On shop page, if we filter by author, then we want to show all books that match that author
    unless params[:author].nil? || params[:author].empty?
      @books = @books.where(author: params[:author])
    end
    # On shop page, if we filter by average_rating, then we want to show all books that match that average_rating
    unless params[:average_rating].nil? || params[:average_rating].empty? || params[:average_rating].to_f == 0
      @books = @books.select{|book| book.average_rating.to_f >= params[:average_rating].to_f}
    end
    @transaction_item = current_transaction.transaction_items.new
  end

  def show
    @book = Book.find(params[:id])
    # Show "Add Review" option on Shops#show page only if the user has purchased the book or if user is admin
    @book_purchased = TransactionItem.where(user_id: current_user.id).collect(&:book_id).include?(@book.id)
  end
end
