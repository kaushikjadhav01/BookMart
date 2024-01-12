class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    # Show books by author on /books page. authorize is used to authroize page using Pundit policies given in app/policies
    @books = params[:author] && !params[:author].empty? ? Book.where("lower(author) LIKE ?", "%#{params[:author].downcase}%") : Book.all
    authorize @books
  end

  # GET /books/1 or /books/1.json
  def show
    authorize @book
  end

  # GET /books/new
  def new
    @book = Book.new
    authorize @book
  end

  # GET /books/1/edit
  def edit
    authorize @book
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    authorize @book
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    authorize @book
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      query = "buy #{params.require(:book)[:name]} book"
      search = GoogleSearch.new(q: query, tbm: "isch", serp_api_key: "c3f83c6e6edb41d903c53d2f5578cf2dd4c89b9c5aeef8611da961ee19387295")
      hash_results = search.get_hash[:images_results]
      hash_results.each do |result|
        if result[:original]
          @book_image = result[:original]
          break
        end
      end
      if @book_image.nil?
        @book_image = "/assets/book.jpeg"
      end
      params.require(:book).permit(:name, :author, :publisher, :price, :stock).merge(image: @book_image)
    end
end
