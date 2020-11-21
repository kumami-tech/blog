export default () => {

  document.addEventListener('DOMContentLoaded', () => {
    
    const menu_btn = document.getElementById('Post_menu_btn');
    const menu = document.getElementById('Post_menu');

    document.addEventListener('click', () => {
      menu.style.display = 'none';
    })

    menu_btn.addEventListener('click', e => {
      e.stopPropagation();
      if (menu.style.display === 'block') {
        menu.style.display = 'none';
      } else {
        menu.style.display = 'block';
      }
    })

  });

}