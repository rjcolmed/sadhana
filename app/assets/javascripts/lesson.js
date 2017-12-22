class Lesson {
  constructor(json) {
    this.id = json.id;
    this.title = json.title;
    this.location = json.location;
    this.time = json.time;
    this.description = json.description;
    this.teacher = json.teacher;
    this.tags = json.tags;
    this.comments = json.comments;
  }

  teacherName() {
    return `${this.teacher.first_name} ${this.teacher.last_name}`
  }

  formatTime() {
  return moment(this.time).format('MMMM DD[,] YYYY [at] h:mm a');
  }
}
 
Lesson.success = (json) => {
  let lesson = new Lesson(json);

  $('#lessonTitle').text(lesson.title);
  $('#lessonDescription').text(lesson.description);
  $('#lessonLocation').text(lesson.location);
  $('#lessonTime').text(lesson.formatTime);
  $('#lessonTeacherImage').attr('src', lesson.teacher.image);

  let teacherLinkHTML = Lesson.teacherLinkTemplate(lesson);
  $('#lessonTeacherName').html(teacherLinkHTML);

  let tagsHTML = Lesson.tagsTemplate(lesson);
  $('#lessonTags').html(tagsHTML);

  let commentsHTML = Lesson.commentsTemplate(lesson);
  $('.ui.comments').html(commentsHTML);

  let dropLessonLinkHTML = Lesson.dropLessonLinkTemplate(lesson);
  $('#dropLessonLink').html(dropLessonLinkHTML);

  $(".js-next").attr('data-id', lesson.id);
  $(".new_comment").attr('action', `/lessons/${lesson.id}/enrollment`);
}
 
Lesson.error = (err) => {
  console.log(err);
}

Lesson.gotLessons = (lessons) => {
  Lesson.teacherLessonsTemplate = Handlebars.compile(Lesson.teacherLessonsSource);
  
  const lessonsHTML = lessons.map(obj => Lesson.teacherLessonsTemplate(new Lesson(obj)));

  $('.ui.comments').html(lessonsHTML);
} 

Lesson.nextButtonClickListener = (event) => {
  event.preventDefault();

  Lesson.teacherLinkTemplate = Handlebars.compile(Lesson.teacherLinkSource);
  Lesson.tagsTemplate = Handlebars.compile(Lesson.tagsSource);
  Lesson.commentsTemplate = Handlebars.compile(Lesson.commentsSource);
  Lesson.dropLessonLinkTemplate = Handlebars.compile(Lesson.dropLessonLinkSource);

  let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;
  
  $.get(`/lessons/${nextLessonId}.json`)
    .done(Lesson.success)
    .fail(Lesson.error);
}

Lesson.bindNextButtonClickListener = () => {
  $('.js-next').click(Lesson.nextButtonClickListener);
  console.log('next lesson listener bound');
}

Lesson.viewLessonsClickListener = function(event) {

  event.preventDefault()
  
  $.get(`/teachers/${this.dataset.id}/lessons.json`)
    .done(Lesson.gotLessons)
    .fail(Lesson.error);
}

Lesson.bindViewLessonsClickListener = function() {
  $('.js-lessons').click(Lesson.viewLessonsClickListener);
  console.log('listener bound');
}

Lesson.ready = function() {
  Lesson.bindViewLessonsClickListener();
  Lesson.bindNextButtonClickListener();

  Lesson.teacherLinkSource = $('#teacher-link-template').html();
  Lesson.tagsSource = $('#tags-template').html();
  Lesson.teacherLessonsSource = $('#teacher-lessons-template').html();
  Lesson.commentsSource = $('#comments-template').html();
  Lesson.dropLessonLinkSource = $('#drop-lesson-link-template').html();

}
