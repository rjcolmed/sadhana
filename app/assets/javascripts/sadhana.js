// $(() => {
//   setListeners();
// });

function setListeners() {

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


 
