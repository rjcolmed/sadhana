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
      }

      lessonsHTML += '</ul>'

      console.log(lessonsHTML);
      $('#lessonInfo').html(lessonsHTML);
    });
  });

  //get next teacher lesson
  $('.js-next').click((event) => {
    event.preventDefault();

    let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;

    $.get(`/lessons/${nextLessonId}.json`, lesson => {
      $('#lessonTitle').text(lesson.title);
      $('#lessonDescription').text(lesson.description);
      $('#lessonLocation').text(lesson.location);
      $('#lessonTime').text(lesson.time);
      $('#lessonTeacherImage').attr('src', lesson.teacher.image);
      let lessonTeacherHTML = `<a href="/teachers/${lesson.teacher.id}">${lesson.teacher.first_name} ${lesson.teacher.last_name}</a>`
      $('#lessonTeacherName').html(lessonTeacherHTML);

      let lessonTagsHTML = '';
      for(let i = 0; i < lesson.tags.length; i++) {
        lessonTagsHTML += `<div class="ui teal tag label"><a href="/tags/${lesson.tags[i].id}">${lesson.tags[i].name}</a></div>`
      }
      $('#lessonTags').html(lessonTagsHTML);

      $(".js-next").attr('data-id', lesson.id);
    });
  });

  $('#reviewForm').submit(function(event) {
    event.preventDefault();

    let serializedReview = $(this).serialize();

    $.post('/reviews', serializedReview, function(review) {
      
    });
  }); 

}


 
