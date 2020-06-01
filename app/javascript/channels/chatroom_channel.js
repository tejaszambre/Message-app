import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if ($('#h1-tag-index').data('current') == data.user) {
      $('#message-container').append("<p class= 'ui right grey aligned header' id= 'message-box'><span class= '' id='time-on-message'>" + data.create_at + "</span><span class='ui label' id='my-message-body'>" + data.mod_message + "<br></span></p>")
    } else {
      $('#message-container').append("<p class= 'ui left grey aligned header' id= 'message-box'><span class='ui label' id='frnd-message-body'><span id='username-on-message'><em>" + data.username + " :</em></span><br>" + data.mod_message + "<br></span><span class= '' id='time-on-message'>" + data.create_at + "</span></p>")
    }
    scroll_bottom()
  }
});
