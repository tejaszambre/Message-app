class MessagesController < ApplicationController

  def create
    # byebug
    message = current_user.messages.build(permit_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
    end
  end

  private
  def permit_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
