# feature 'User Incorrect Sign Up' do
#   scenario 'cannot sign up to the app' do
#     #expect { sign_up(password_confirmation: 'something else') }.not_to change(User, :count)
#   end
# end


feature 'Password Confirmation' do
   scenario 'requests user to confirm password' do
     expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
     expect(current_path).to eq '/users'
     expect(page).to have_content 'Password does not match the confirmation'
     expect(find_field('email').value).to eq ('paulyjgooders@gmail.com')
   end

 end
