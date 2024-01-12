require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  before { 
    allow(controller).to receive(:authenticate_user!).and_return(true)

  }

  context "Validation tests" do
    it "Verify index flow, fetching all reviews" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save
      Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great").save
      Review.new(user_id: 1, book_id: 1, rating: 3, review: "This is meh").save
      Review.new(user_id: 1, book_id: 1, rating: 1, review: "This is awful").save

      get :index

      expect(Review.all.size).to eq(3)
    end

    it "Verify index flow, fetching review by book_id" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save
      Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great").save
      Review.new(user_id: 1, book_id: 2, rating: 3, review: "This is meh").save
      Review.new(user_id: 1, book_id: 3, rating: 3, review: "This is meh").save
      Review.new(user_id: 1, book_id: 1, rating: 1, review: "This is awful").save

      get :index, params: { book_id: 1 }

      expect(Review.all.size).to eq(2)
    end


    it "Verify index flow, fetching review by id" do
      Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save
      Book.new(name: "Fantastic Beasts", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save
      User.new(username: "testUser2", password: "123456", name: "test", email: "test2@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save


      reviewOne = Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great")
      reviewOne.save
      Review.new(user_id: 2, book_id: 2, rating: 3, review: "This is meh").save
      

      get :show, params: { id: 1 }

      expect(assigns(:review)).to eql(reviewOne)

    end

    it "Verify creating a new review" do 
      Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      post :new, params: { book_id: 1 }

      expect(assigns(:review)).should_not be_nil
    end

    it "Verify deleting existing review" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save

      reviewOne = Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great")
      reviewOne.save

      expectation = expect(controller).to receive(:authorize).with(reviewOne)

      expect do 
        delete :destroy, params: {id: 1}
      end.to change(Review, :count).by(-1)
    end

    it "Verify updating existing review" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save

      reviewOne = Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great")
      reviewOne.save

      expectation = expect(controller).to receive(:authorize).with(reviewOne)

      form_params = {
        review: "This"
      }
      patch :update, params: {id: 1, review: {review: "This is more than five start"}}

      expect(response).to redirect_to '/reviews/1'

    end
  end
end
