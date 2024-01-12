require 'rails_helper'

RSpec.describe Book, type: :model do
  context "Validation tests" do
    it "Verify book is valid with all attributes" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save
      expect(book).to eq(true)
    end

    it "Verify book is not valid without first name" do
      book = Book.new(author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid without author" do
      book = Book.new(name: "Harry Potter", publisher: "Scholastic Press", price: 30, stock: 1).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid without price" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", stock: 1).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid without stock" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid with price of 0" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 0, stock: 1).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid with a negative price" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: -1, stock: 1).save
      expect(book).to eq(false)
    end

    it "Verify book is not valid with negative stock" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: -1).save
      expect(book).to eq(false)
    end

    it "Generate expected average rating from a few books" do
      book = Book.new(name: "Harry Potter", author: "JK Rowling", publisher: "Scholastic Press", price: 30, stock: 1).save

      User.new(username: "testUser", password: "123456", name: "test", email: "test@email.com", address: "123 address", credit_card_number: 3333333333333333, phone_number: 1234567890).save
      Review.new(user_id: 1, book_id: 1, rating: 5, review: "This is great").save
      Review.new(user_id: 1, book_id: 1, rating: 3, review: "This is meh").save
      Review.new(user_id: 1, book_id: 1, rating: 1, review: "This is awful").save

      expect(Book.all.where(id: 1)[0].average_rating).to eq(3)
    end

  end
end
