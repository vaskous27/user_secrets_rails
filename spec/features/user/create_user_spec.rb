require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit 'users/new'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'user[email]', with: 'santa@vacay.com'
    fill_in 'user[name]', with: 'santa'
    fill_in 'user[password]', with:  'naughty'
    fill_in 'user[password_confirmation]', with: 'naughty'
    click_button 'Create a User'
    last_user = User.last
    expect(current_path).to eq("/")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Create a User'
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("Name can't be blank")
    expect(page).to have_text("Email can't be blank")
     expect(page).to have_text("Password can't be blank")
  end
end