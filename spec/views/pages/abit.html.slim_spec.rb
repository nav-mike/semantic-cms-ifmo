require 'rails_helper'

RSpec.describe 'pages/abit.html.slim', type: :view do
  it 'should have text on page: "Как определиться с будущей профессией?"' do
    render
    expect(rendered).to have_content('Как определиться с будущей профессией?')
  end
end
