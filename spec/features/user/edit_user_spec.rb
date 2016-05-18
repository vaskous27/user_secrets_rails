require 'rails_helper'
RSpec.describe 'editing user' do
  it 'displays prepopulated form' do
    user = create_user
    log_in user
    click_link 'Show Profile'
    click_link 'Edit'
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[name]')
  end
end