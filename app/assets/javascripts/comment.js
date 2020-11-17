$(function(){
  function buildHTML(comment){
    const html = `<div class="Comment">
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
    const formData = new FormData(this);
    const url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      const html = buildHTML(data);
      $('.Comment_index').prepend(html);
      $('.Comment_form__Field').val('');
      $('.Comment_form__Btn').prop('disabled', false);
      $('.Comment_empty').hide();
    })
    .fail(function(){
      alert('入力に不備があります');
      $('.Comment_form__Btn').prop('disabled', false);
    })
  })
});