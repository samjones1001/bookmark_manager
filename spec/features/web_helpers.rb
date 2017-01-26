def sign_up(email: "paulyjgooders@gmail.com", password: "password123", password_confirmation: "password123")
  visit('/users/new')
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('submit')
end
