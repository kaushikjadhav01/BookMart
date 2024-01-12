# App Behavior Details

## Admin User Creds:
**Username:** admin <br/>
**Email Address:** admn.bookmart@gmail.com <br/>
**Password:** Samplepass@123 <br/>

When loading up the application on a browser, the user is redirected to login screen if not logged in
One may login by:

1) Using admin user credentials listed above
    -Enter in admin's username/email address and password
2) Creating a new account (marked by the link, "Create an Account")
    -Create a new account with first name, last name, email and password
    -You can later log out and log back in with the newly created account
## Demo
[<img src="https://i.ytimg.com/vi/wCl_MHH4gtA/maxresdefault.jpg" width="50%">](https://www.youtube.com/watch?v=wCl_MHH4gtA "CSC 517 RoR BookMart")

## Home Page (path: /)
On the home page, the user is presented with a list of tabs to navigate to from the top bar

A list of all books are present onscreen

A user can add books to cart in order to purchase

    Clicking the cart button on the top right of the page leads the user to the /carts page for checkout

One can filter the list of books by average rating and author on the left-hand side

    The allowable values for ratings are 1-5

    Click the filter button to apply the changes to see filtered list of books by average rating or author or both

## Profile Page (path: /users/edit)
This page is navigated to by clicking on "Profile" on the top bar

This page lists all of the attributes of users that can be updated

    Fields include username(non-admin only), address, name, credit card number, email, and phone number

    User would confirm changes by entering current password and clicking "Update"

(For non-admin users) There's an option to cancel account. Canceling account will delete the user

## Transaction History Page (path: /transactions)
This page will list all transactions that user have made
    
    For non-admin users, they will only see their transactions

    For admin users, they will see all user transactions

The page lists for each transaction the username, name of user, user email, address,
credit card number, phone number, number of items purchased and the final transaction price

## Reviews Page (path: /reviews)
The reviews page list all user reviews made on existing books

A user can search for book(s) via the search bar

    User can type in partial/whole term for username or book title to see a filtered result of books

    Casing does not matter

A review shown consists of review number, username, book name, rating, review text, and actions that
allow the admin or user of their own reviews to:

    Edit- edit the existing review

    Destroy- deletes the given review and navigates user to the Reviews for Book Page

    Show- Navigates user to the Specific Review Page

## Users Page (path: /users)
This page is only accessible by the admin

This page shows all users of the website

There's a button to make a new user by clicking "New user"

Each user is displayed with user id, username, name, email, address, credit card number, phone number
and actions, which comprise of

    Edit- edit the existing user

    Destroy- deletes the given user

    Show- Shows the details of given user only

## Books Page (path: /books)
This page is only accessible by the admin

This page shows a list of books available to the website

A search bar is present where a user can type in the author of the book to receive a filtered list with only that author

    Clicking search will perform the search

    Casing does not matter

From each row, a book displays

    book id, name, author, publisher, price, stock, average rating, and actions, which consist of

        Edit- edit the existing book

        Destroy- deletes the given book

        Show- Shows the details of given book only

## Carts Page (path: /carts)
A user sees their existing book(s) in cart prior to purchase

A user would checkout using their address (required), credit card number (required), and phone number (required)

Clicking submit creates a transaction. User is taken to the transactions page to see their purchase

## Specific Review Page (path: /reviews/{review_id})
A user sees exactly one review of the given review_id. Shows a subset of results from Reviews Page

## Editing Review Page (path: /reviews/{review_id}/edit)
This page allows user to edit existing review on

    current rating and review text

    User can click "Update Review" to permeate changes to existing review

## New Review Page (path: /reviews/new?book_id={book_id})
This page allows the user to create a review for the current book by id

Rating is from 1-5

User can write their review

User can press "Create Review", which navigate user to the Specific Review Page

## Review for book Page (path: /reviews?book_id={book_id})
This page gives an option for user to add a new review for current book 

This page also lists all existing reviews for given book. Shows a subset of results from Reviews Page

## New User Page (path: /users/new)
This page allows a new user to be created

This page is only accessible by admin as they are the only ones who can create other users on the website

Minimum fields to fill out are:

    Username must not be blank

    Email must include @

    Password must be filled out (must be minimum 6 characters)

    Password and password confirmation must be both filled out and be the same

    Name must be filled out

Click submit to create user once minimum fields are filled out

## Shops Item Page (path: /shops/{book_id})
This page shows the current book with options to

    Show reviews for the book

    Add new review

    Navigate back to the previous page
