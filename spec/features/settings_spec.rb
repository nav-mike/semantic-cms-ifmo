require 'rails_helper'

describe 'settings specs', type: :feature do
  let!(:user) { FactoryGirl.create :user }
  let!(:department_title) { FactoryGirl.create :setting, key: 'department_title', value: 'Кафедра информатики и прикладной математики', can_removed: false }
  before(:each) do
    visit '/admin'

    fill_in 'inputEmail', with: user.email
    fill_in 'inputPassword', with: user.password

    click_button 'Sign in'
  end

  it 'GET /settings' do
    click_link 'Settings'
    expect(page).to have_content 'New Setting'
  end

  it 'GET /settings/new' do
    visit '/settings/new'
    expect(page).to have_content 'Add new setting '
  end

  it 'GET /settings/1/edit' do
    visit "/settings/#{department_title.id}/edit"
    expect(page).to have_content 'Editing department_title '
  end
end
