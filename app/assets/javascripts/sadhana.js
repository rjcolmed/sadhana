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
        lessonsHTML += `<div class="item"><div class="content"><i class="users icon"></i><a class="header" href="/lessons/${lessons[i].id}">${lessons[i].title}</a><div class="description">When: ${lessons[i].time} at ${lessons[i].location}</div></div></div>`
      }

      lessonsHTML += '</ul>'
      $('.ui.comments').html(lessonsHTML);
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


 
