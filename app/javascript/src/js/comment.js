export default () => {

  document.addEventListener('DOMContentLoaded', () => {
    const token = document.getElementsByName('csrf-token')[0].content;
    const createHTML = (comment) => {
      const strHtml = '<div class="Comment">' +
                        '<div class="Comment_info">' +
                          '<div class="Nickname">' + comment.nickname + '</div>' +
                          '<div class="Time">' + comment.created_at + '</div>' +
                        '</div>' +
                        '<div class="Comment_content">' +
                          '<p>' + comment.content + '</p>' +
                        '</div>' +
                      '</div>';
      const divElm = document.createElement('div');
      divElm.innerHTML = strHtml;
      return divElm.children[0];
    };

    document.getElementById('Comment_form').addEventListener('submit', e => {
      e.preventDefault();

      const inputNickname = document.getElementById('Nickname_field').value;
      const inputContent = document.getElementById('Content_field').value;
      const url = document.getElementById('Comment_form').getAttribute('action') + '.json';
      const hashData = {
        comment: { nickname: inputNickname, content: inputContent }
      };
      const data = JSON.stringify(hashData);
      const xmlHR = new XMLHttpRequest();
      const FormBtn = document.getElementById('Comment_form__Btn');

      xmlHR.open('POST', url);
      xmlHR.responseType = 'json';
      xmlHR.setRequestHeader('Content-Type', 'application/json');
      xmlHR.setRequestHeader('X-CSRF-Token', token);
      xmlHR.send(data);
      xmlHR.onreadystatechange = () => {
        if (xmlHR.readyState === 4) {
          if (xmlHR.status === 200) {
            const comment = xmlHR.response;
            const html = createHTML(comment);
            const comments = document.getElementById('Comment_index');
            comments.insertBefore(html, comments.firstChild);
            document.getElementById('Nickname_field').value = '';
            document.getElementById('Content_field').value = '';
          } else {
            alert('入力に不備があります');
          }
          FormBtn.disabled = false;
          FormBtn.removeAttribute('data-disable-with');
        }
      };
    });
  });

}