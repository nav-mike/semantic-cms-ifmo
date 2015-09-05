require 'rails_helper'

RSpec.describe Setting, type: :model do
  it 'remove if can_removed is false' do
    setting = FactoryGirl.create :setting, can_removed: false
    setting.destroy
    expect(Setting.count).to eq 1
  end
end
