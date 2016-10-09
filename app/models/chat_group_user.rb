class ChatGroupUser < ApplicationRecord
  belongs_to :chat_group
  belongs_to :user

  validates :chat_group, presence: true
  validates :user, presence:true
end
