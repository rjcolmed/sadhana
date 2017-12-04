$(() => {
  setListeners();
});

function setListeners() {
  //get individual teacher's lessons
  $('.js-lessons').click(() => {
    let id = $('.js-lessons').attr('data-id');
    $.get(`/teachers/${id}/lessons.json`, (res) => {
      console.log(res);
    });
  });

}


 
