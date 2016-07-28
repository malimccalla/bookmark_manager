def sign_up
  visit 'users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'mali@bum.com'
  fill_in :password, with: 'Isuck'
  click_button 'Sign up'
end
