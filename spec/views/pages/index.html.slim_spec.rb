require 'rails_helper'

RSpec.describe 'pages/index.html.slim', type: :view do
  it 'should have specific text on index page' do
    render
    expect(rendered).to have_content 'Кафедра информатики и прикладной математики совместо с кафедрой ВТ обеспечивает подготовку'
  end
end
