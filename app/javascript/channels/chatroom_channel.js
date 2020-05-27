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
      $('#message-container').append("<p class= 'ui right green aligned header' id='my-message-body'><big><em>" + data.username + "</em>:</big> " + data.mod_message + "</p>")
    } else {
      $('#message-container').append("<p class= 'ui left teal aligned header' id='my-message-body'><big><em>" + data.username + "</em>:</big> " + data.mod_message + "</p>")
    }
    scroll_bottom()
  }
});
