class ReviewsController < ApplicationController
    before_action :set_review, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    # Get review for a book by clicking that book
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @reviews = Review.where(book_id: params[:book_id].to_i)
    # Search Review by Book or Username by typing in search bar
    elsif (params[:search] && !params[:search].empty?)
      searchTerm = params[:search].downcase
      @reviews = Review.all.select { 
        |item|  item.user.name.downcase.include? searchTerm or 
        item.book.name.downcase.include? searchTerm }
    else
      @reviews = Review.all
    end
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @reviews = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    authorize @review
  end

  # POST /reviews or /reviews.json
  def create
    @book = Book.find(review_params[:book_id])
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    authorize @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    authorize @review
    @book = @review.book
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url(book_id: @book.id), notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
        @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :book_id, :rating, :review, :search)
    end
end
