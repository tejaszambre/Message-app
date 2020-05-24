class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
    @message = Message.new
    @user = User.where(online: true)
  end

end
