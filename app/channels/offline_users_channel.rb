class OfflineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "offline_users_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
