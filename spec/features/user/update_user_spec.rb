require 'rails_helper'
RSpec.describe 'updating user' do
  it 'updates user and redirects to main page' do
    user = create_user
    log_in user
    expect(page).to have_text('kobe')
    click_link 'Show Profile'
    click_link 'Edit'
    fill_in 'user[name]', with: 'bertha'
    fill_in 'user[password]', with: '12345'
    fill_in 'user[password_confirmation]', with: '12345'
    click_button 'Update'
    expect(page).not_to have_text('v')
    expect(page).to have_text('bertha')
  end
end