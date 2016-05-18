require 'rails_helper'
RSpec.describe 'creating a secret' do
  it 'creates a new secret and redirects to profile page' do
    user = create_user
    log_in user
    click_link 'Show Profile'
    fill_in 'secret[content]', with: 'My secret'
    click_button 'Post'
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_text('Tell a Secret')
  end
end