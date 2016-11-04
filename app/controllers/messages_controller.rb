class MessagesController < ApplicationController
  before_action :set_chat_groups
  before_action :set_chat_group

  def index
    @message = Message.new
    @messages = @chat_group.messages

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @chat_group.messages.includes(:user).map(&:to_api_json) }
    end
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chat_group = @chat_group

    if @message.save
      redirect_to chat_group_messages_path(@chat_group), notice: 'メッセージを送信しました'
    else
      flash.now[:alert] = @message.errors.full_messages.join(', ')
      render :index
    end

    respond_to do |format|
      if @message.save
        format.html do
          redirect_to chat_group_messages_path(@chat_group), notice: 'メッセージを送信しました'
        end
        format.json do
          render json: @message.to_api_json
        end
      else
        format.html do
          flash.now[:alert] = @message.errors.full_messages.join(', ')
          render :index
        end
        format.json do
          render json: @message.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_chat_groups
    @chat_groups = ChatGroup.all
  end

  def set_chat_group
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
