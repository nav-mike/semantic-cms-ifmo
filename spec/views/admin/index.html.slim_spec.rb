require 'rails_helper'

RSpec.describe 'admin/index.html.slim', type: :view do
  it 'should have h1 is "Dashboard"' do
    render
    expect(rendered).to have_content('Dashboard')
  end
end
