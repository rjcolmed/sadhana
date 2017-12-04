$(() => {
  setListeners();
});

function setListeners() {
  //get individual teacher's lessons
  $('.js-lessons').click((event) => {
    event.preventDefault();

    let id = $('.js-lessons').attr('data-id');
    let lessonsHTML = '<ul>'

    $.get(`/teachers/${id}/lessons.json`, (lessons) => {
      for(let i = 0; i < lessons.length; i++) {
        lessonsHTML += `<li><a href="/lessons/${lessons[i].id}">${lessons[i].title}</a></li>`
        console.log(lessonsHTML);
      }

      lessonsHTML += '</ul>'

      console.log(lessonsHTML);
      $('#lessonInfo').html(lessonsHTML);
    });
  });

}


 
