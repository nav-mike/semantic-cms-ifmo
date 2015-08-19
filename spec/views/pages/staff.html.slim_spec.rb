require 'rails_helper'

RSpec.describe 'pages/staff.html.slim', type: :view do
  it 'should have "Муромцев Дмитрий Ильич, к.т.н., доцент, зав. кафедрой"' do
    render
    expect(rendered).to have_content 'Муромцев Дмитрий Ильич, к.т.н., доцент, зав. кафедрой'
  end
end
