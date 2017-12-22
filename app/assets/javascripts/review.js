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

  formatPostTime() {
    return moment(this.postTime).format('MMMM DD[,] YYYY [at] h:mm a');
  }
}

Review.success = (json) => {
  const review = new Review(json);
  Review.reviewTemplate = Handlebars.compile(Review.reviewTemplateSource);
  
  const reviewHTML = Review.reviewTemplate(review);

  $('.ui.comments').append(reviewHTML);
  //re-enable the submit button
  $('input').prop('disabled', false);
  $('textarea').val('');
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

Review.submitListener = function(event) {
  event.preventDefault();
  const $form = $(this);
  const params = $form.serialize();
  const action = $form.attr("action");

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

Review.reviewsClickListener = function(event) {
  event.preventDefault();

  $.get(`/teachers/${this.dataset.id}/reviews.json`)
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

