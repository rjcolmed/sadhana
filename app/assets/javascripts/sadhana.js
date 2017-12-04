$(() => {
  setListeners();
});

function setListeners() {
  //get individual teacher's lessons
  $('.js-lessons').click(event => {
    event.preventDefault();

    let id = $('.js-lessons').attr('data-id');
    let lessonsHTML = '<ul>'

    $.get(`/teachers/${id}/lessons.json`, (lessons) => {
      for(let i = 0; i < lessons.length; i++) {
        lessonsHTML += `<li><a href="/lessons/${lessons[i].id}">${lessons[i].title}</a></li>`
      }

      lessonsHTML += '</ul>'

      console.log(lessonsHTML);
      $('#lessonInfo').html(lessonsHTML);
    });
  });

  //get next teacher lesson
  $('.js-next').click(event => {
    event.preventDefault();

    let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;

    $.get(`/lessons/${nextLessonId}.json`, lesson => {
      $('#lessonTitle').text(lesson.title);
      $('#lessonDescription').text(lesson.description);
      $('#lessonLocation').text(lesson.location);
      $('#lessonTime').text(lesson.time);
    });

  });

}


 
