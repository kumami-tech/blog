$(function(){
  function buildHTML(comment){
    let html = `<div class="Comment">
                  <div class="Comment_info">
                    <div class="Nickname">
                      ${comment.nickname}
                    </div>
                    <div class="Time">
                      ${comment.created_at}
                    </div>
                  </div>
                  <div class="Comment_content">
                    <p>${comment.content}</p>
                  </div>
                </div>`
    return html;
  }
  $('.Comment_form').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.Comment_index').prepend(html);
      $('.Comment_form__Field').val('');
      $('.Comment_form__Btn').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを投稿できませんでした');
    })
  })
});