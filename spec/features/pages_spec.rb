require 'rails_helper'

describe 'pages specs', type: :feature do
  let!(:user) { FactoryGirl.create :user }
  let!(:_university_title) do
    FactoryGirl.create :setting, key: 'university_title',
                                 value: 'Санкт-Петербургский национальный исследовательский университет информационных технологий, механики и оптики',
                                 can_removed: false
  end
  let!(:_department_title) { FactoryGirl.create :setting, key: 'department_title', value: 'Кафедра информатики и прикладной математики', can_removed: false }
  before(:each) do
    visit '/admin'

    fill_in 'inputEmail', with: user.email
    fill_in 'inputPassword', with: user.password

    click_button 'Sign in'
    visit '/admin/pages'
  end

  it 'index h1' do
    expect(page).to have_content 'Pages'
  end
end
