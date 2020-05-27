class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.custom_display
    @user = User.where(online: true)
  end

end
