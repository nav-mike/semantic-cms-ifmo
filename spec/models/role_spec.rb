require 'rails_helper'

RSpec.describe Role, type: :model do
  it '#add_role' do
    user = User.create! email: 'm.navrotskiy@gmail.com', password: '12345678'
    user.add_role 'admin'

    expect(Role.count).to eq 1
  end
end
