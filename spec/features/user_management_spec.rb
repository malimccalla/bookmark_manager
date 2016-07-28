require 'spec_helper'
require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, mali@bum.com')
    expect(User.first.email).to eq ('mali@bum.com')
  end
  scenario 'user signs up with mismatched password' do
    expect{mismatched_password_sign_up}.not_to change(User, :count)
  end
end
