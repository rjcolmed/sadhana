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
  .fail();
}

Review.bindSubmitListener = () => {
  $('#reviewForm').submit(Review.submitListener);
}

Review.ready = () => {
  Review.reviewTemplateSource = $('#review-template').html();
  Review.bindSubmitListener();
}

$(() => {
  Review.ready();
});
