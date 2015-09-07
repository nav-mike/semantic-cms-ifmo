require 'rails_helper'

describe 'admin specs', type: :feature do
  let!(:user) { FactoryGirl.create :user }
  let!(:_department_title) { FactoryGirl.create :setting, key: 'department_title', value: 'Кафедра информатики и прикладной математики', can_removed: false }
  before(:each) do
    visit '/admin'

    fill_in 'inputEmail', with: user.email
    fill_in 'inputPassword', with: user.password

    click_button 'Sign in'
  end

  it 'GET /admin' do
    visit '/admin'
    expect(page).to have_content 'Dashboard'
  end
end
