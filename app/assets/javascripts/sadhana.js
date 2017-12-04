$(() => {
  setListeners();
});

function setListeners() {
  //get individual teacher's lessons
  $('.js-lessons').click((event) => {
    event.preventDefault();

    let id = $('.js-lessons').attr('data-id');
    let lessonsHTML = '<h3 class="ui dividing header">Your Lessons</h3><ul>'

    $.get(`/teachers/${id}/lessons.json`, (lessons) => {
      for(let i = 0; i < lessons.length; i++) {
        lessonsHTML += `<div class="item"><div class="content"><a class="header" href="/lessons/${lessons[i].id}">${lessons[i].title}</a><div class="description">When: ${lessons[i].time} at ${lessons[i].location}</div></div></div>`
      }

      lessonsHTML += '</ul>'
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
      let teacherReviewHTML = `
      <div class="comment">
      <a class="avatar">
        <img src="${review.student.image}">
      </a>
      <div class="content">
        <a class="author">${review.student.first_name} ${review.student.last_name}</a>
        <div class="metadata">
          <span class="date">${review.created_at}</span>
        </div>
        <div class="text">
          ${review.body}
        </div>
      </div>
    </div>`
    
      $('.ui.comments').append(teacherReviewHTML);
    });
  }); 

  $('.js-reviews').click((event) => {
    event.preventDefault();

    let teacherId = $('.js-reviews').attr('data-id');
    let teacherReviewsHTML = '<h3 class="ui dividing header">Reviews</h3>'
    
    $.get(`/teachers/${teacherId}/reviews.json`, (reviews) => {
      
      for(let i = 0; i < reviews.length; i++) {
        teacherReviewsHTML += `
        <div class="comment">
        <a class="avatar">
          <img src="${reviews[i].student.image}">
        </a>
        <div class="content">
          <a class="author">${reviews[i].student.first_name} ${reviews[i].student.last_name}</a>
          <div class="metadata">
            <span class="date">${reviews[i].created_at}</span>
          </div>
          <div class="text">
            ${reviews[i].body}
          </div>
        </div>
      </div>`
      }

      $('.ui.comments').html(teacherReviewsHTML);

    }); 
   
  });

}


 
