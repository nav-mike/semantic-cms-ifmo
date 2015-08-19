require 'rails_helper'

RSpec.describe 'pages/student.html.slim', type: :view do
  it 'should have "Информация по практике для студентов 2-го и 3-го курсов."' do
    render
    expect(rendered).to have_content 'Информация по практике для студентов 2-го и 3-го курсов.'
  end
end
