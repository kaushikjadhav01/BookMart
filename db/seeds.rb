user = User.where(username: 'admin').first_or_initialize

user.update!(
    email: 'admn.bookmart@gmail.com',
    password: 'Samplepass@123',
    name: 'Admin',
    is_admin: true,
    address: 'Admin Address',
    credit_card_number: '4242424242424242',
    phone_number: '9999999999'
)
user.save