import consumer from "./consumer"

consumer.subscriptions.create("OnlineUsersChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#online-users-container').append("<div class='item' id='"+ data.id +"'><img class= 'ui avatar image' src= '/assets/avtar-for-message-me.png' id= 'profile-pic-online'><div class='content'><div class='header'>" + data.username + "</div></div></div>")
  }
});
