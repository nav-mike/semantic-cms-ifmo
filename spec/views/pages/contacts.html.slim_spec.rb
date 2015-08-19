require 'rails_helper'

RSpec.describe 'pages/contacts.html.slim', type: :view do
  it 'should have "Контактная информация"' do
    render
    expect(rendered).to have_content 'Контактная информация'
  end
end
