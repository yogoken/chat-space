class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end
end
