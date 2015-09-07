require 'rails_helper'

describe 'pages specs', type: :feature do
  let!(:_university_title) do
    FactoryGirl.create :setting, key: 'university_title',
                                 value: 'Санкт-Петербургский национальный исследовательский университет информационных технологий, механики и оптики',
                                 can_removed: false
  end
  let!(:_department_title) { FactoryGirl.create :setting, key: 'department_title', value: 'Кафедра информатики и прикладной математики', can_removed: false }
  before(:each) do
    visit '/'
  end

  it 'h1' do
    expect(page).to have_content 'Кафедра информатики и прикладной математики'
  end

  it 'GET "Главная"' do
    click_link 'Главная'
    expect(page).to have_content 'Кафедра информатики и прикладной математики совместо с кафедрой ВТ'
  end

  it 'GET "Абитуриенту"' do
    click_link 'Абитуриенту'
    expect(page).to have_content 'Как определиться с будущей профессией?'
  end

  it 'GET "Студенту"' do
    click_link 'Студенту'
    expect(page).to have_content 'Информация по практике для студентов 2-го и 3-го курсов.'
  end

  it 'GET "Выпускнику"' do
    click_link 'Выпускнику'
    expect(page).to have_content 'Информация для выпускников бакалавриата и специалитета.'
  end

  it 'GET "История"' do
    click_link 'История'
    expect(page).to have_content 'История кафедры'
  end

  it 'GET "Сотрудники"' do
    click_link 'Сотрудники'
    expect(page).to have_content 'Муромцев Дмитрий Ильич, к.т.н., доцент, зав. кафедрой'
  end

  it 'GET "Контакты"' do
    click_link 'Контакты'
    expect(page).to have_content 'Контактная информация'
  end
end
