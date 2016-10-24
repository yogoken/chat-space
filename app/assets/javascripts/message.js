$(function(){
  // CSRFトークンの設定
  $.ajaxSetup({
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    }
  });

  // 自動スクロール
  function scrollToBottom() {
    $('.chat-body').scrollTop( $('.chat-messages').height() );
  }

  // メッセージのHTMLを組み立て
  function buildMessageHTML(message) {
    var html =
      '<li class="chat-message">' +
      '<div class="chat-message__header clearfix">' +
      '<p class="chat-message__name">' +
      message.name +
      '</p>' +
      '<p class="chat-message__time">' +
      message.time +
      '</p>' +
      '</div>' +
      '<p class="chat-message__body">' +
      message.body +
      '</p>' +
      '</li>';
    return html
  }

  scrollToBottom();

  // フォーム送信の非同期化
  $('form#new_message').submit(function(e) {
    var $form = $(this);
    e.preventDefault();

    var fd = new FormData($(this)[0]);

    $.ajax(document.location.href + '.json', {
      method: 'POST',
      processData: false,
      contentType: false,
      data: fd,
      dataType: 'json',
      success: function(json) {
        var insertHTML = buildMessageHTML(json);

        $('ul.chat-messages').append(insertHTML);

        scrollToBottom();

        $form.get(0).reset()
      },
      error: function(json) {
        alert('エラーが発生しました');
      }
    });
  });
});
