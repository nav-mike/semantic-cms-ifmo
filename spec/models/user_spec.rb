require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create new user' do
    expect(User.count).to eq 0

    User.create! email: 'ivan.ivanov@email.com', password: '12345678'

    expect(User.count).to eq 1
  end
end
