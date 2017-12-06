class Review {
  constructor(json){
    this.id = json.id;
    this.author = json.student;
    this.postTime = json.created_at;
    this.body = json.body;
  }

  authorName() {
    return `${this.author.first_name} ${this.author.last_name}`
  }

}

Review.success = (json) => {
  let review = new Review(json);
  Review.reviewTemplate = Handlebars.compile(Review.reviewTemplateSource);
  
  let reviewHTML = Review.reviewTemplate(review);

  $('.ui.comments').append(reviewHTML);
}

Review.getSuccess = (json) => {
  let reviews = json.map(obj => {
    return new Review(obj);
  });

  Review.reviewTemplate = Handlebars.compile(Review.reviewTemplateSource);

  let reviewsHTML = '';
  reviews.forEach(review => {
    reviewsHTML += Review.reviewTemplate(review);
  });

  $('.ui.comments').html(reviewsHTML);
}

Review.error = (err) => {
  console.log(err);
}

Review.submitListener = (event) => {
  event.preventDefault();
  let $form = $('#reviewForm');
  let params = $form.serialize();
  let action = $form.attr("action");

  $.ajax({
    url: action,
    data: params,
    dataType: "json",
    method: "POST"
  })
  .done(Review.success)
  .fail(Review.err);
}

Review.bindSubmitListener = () => {
  $('#reviewForm').submit(Review.submitListener);
}

Review.reviewsClickListener = (event) => {
  event.preventDefault();

  let teacherId = $('.js-reviews').attr('data-id');

  $.get(`/teachers/${teacherId}/reviews.json`)
    .done(Review.getSuccess)
    .fail(Review.err);
}

Review.bindReviewsClickListener = () => {
  $('.js-reviews').click(Review.reviewsClickListener);
}

Review.ready = () => {
  Review.reviewTemplateSource = $('#review-template').html();
  Review.bindSubmitListener();
  Review.bindReviewsClickListener();
}

$(() => {
  Review.ready();
});
