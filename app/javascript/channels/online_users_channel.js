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
    if (data.id == 1)
      $('#online-users-container').append("<div class='item' id='"+ data.id +"'><img class= 'ui avatar image' src= '/assets/avtar-beard.png' id= 'profile-pic-online'></div>")
    else if (data.username == "anonymous") {
      $('#online-users-container').append("<div class='item' id='"+ data.id +"'><img class= 'ui avatar image' src= '/assets/avtar-anonymous.png' id= 'profile-pic-online'></div>")
    }
    else {
      $('#online-users-container').append("<div class='item' id='"+ data.id +"'><img class= 'ui avatar image' src= '/assets/avtar-" + data.id % 3 + ".png' id= 'profile-pic-online'></div>")
    }
  }
});
