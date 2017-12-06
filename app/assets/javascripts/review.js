class Review {
  constructor(json){
    this.id = json.id;
    this.author = json.student;
    this.postTime = json.created_at;
    this.body = json.body;

  }
}

Review.submitListener = (event) => {
  event.preventDefault();
  alert('heyyy');
}

Review.bindSubmitListener = () => {
  console.log('bound');
  $('#reviewForm').submit(Review.submitListener);
}

Review.ready = () => {
  Review.bindSubmitListener();
}

$(() => {
  Review.ready();
});
