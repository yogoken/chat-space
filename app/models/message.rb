class Message < ApplicationRecord
  belongs_to :chat_group
  belongs_to :user

  validates :chat_group, presence: true
  validates :body, presence: true
  validates :user, presence: true

  # 画像投稿
  mount_uploader :image, ImagesUploader

  def to_api_json
    {
      name: user.name,
      body: body,
      time: created_at.strftime('%Y/%m/%d %H:%M:%S'),
      image_url: image.to_s
    }
  end
end
