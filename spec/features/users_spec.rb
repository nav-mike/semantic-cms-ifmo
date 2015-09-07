require 'rails_helper'

describe 'users specs', type: :feature do
  let!(:user) { FactoryGirl.create :user }
  let!(:_department_title) { FactoryGirl.create :setting, key: 'department_title', value: 'Кафедра информатики и прикладной математики', can_removed: false }
  before(:each) do
    visit '/admin'

    fill_in 'inputEmail', with: user.email
    fill_in 'inputPassword', with: user.password

    click_button 'Sign in'
  end

  it 'GET /users' do
    click_link 'Users'
    expect(page).to have_content 'New User'
  end

  it 'GET /users/new' do
    visit '/users/new'
    expect(page).to have_content 'Add new user '
  end

  it 'GET /users/1/edit' do
    visit "/users/#{user.id}/edit"
    expect(page).to have_content 'Editing user'
  end
end
