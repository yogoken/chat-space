require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'valid' do
    expect(build(:message)).to be_valid
  end

  it 'body is necessary' do
    message = build(:message, body: nil)
    expect(message).to be_invalid
    expect(message.errors[:body]).to include("can't be blank")
  end
end
