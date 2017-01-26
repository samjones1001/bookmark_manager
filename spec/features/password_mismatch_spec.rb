# feature 'User Incorrect Sign Up' do
#   scenario 'cannot sign up to the app' do
#     #expect { sign_up(password_confirmation: 'something else') }.not_to change(User, :count)
#   end
# end


feature 'Password Confirmation' do
   scenario 'requests user to confirm password' do
     expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)

   end
 end
