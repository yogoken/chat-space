class Message < ApplicationRecord
  belongs_to :chat_group
  belongs_to :user

  validates :chat_group, presence: true
  validates :body, presence: true
  validates :user, presence: true

  def to_api_json
    {
      name: user.name,
      body: body,
      time: created_at.strftime('%Y/%m/%d %H:%M:%S')
    }
  end
end
