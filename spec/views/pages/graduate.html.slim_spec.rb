require 'rails_helper'

RSpec.describe 'pages/graduate.html.slim', type: :view do
  it 'should have "Шаблоны документов для ВКР бакалавра"' do
    render
    expect(rendered).to have_content 'Шаблоны документов для ВКР бакалавра'
  end
end
