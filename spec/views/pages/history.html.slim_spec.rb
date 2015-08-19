require 'rails_helper'

RSpec.describe 'pages/history.html.slim', type: :view do
  it 'should have "История кафедры"' do
    render
    expect(rendered).to have_content 'История кафедры'
  end
end
