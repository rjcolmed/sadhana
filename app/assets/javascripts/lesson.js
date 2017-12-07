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

  $(".js-next").attr('data-id', lesson.id);
  $(".new_comment").attr('action', `/lessons/${lesson.id}/enrollment`);
}
 
Lesson.error = (err) => {
  console.log(err);
}

Lesson.gotLessons = (json) => {
  let lessons = json.map(obj => {
    return new Lesson(obj);
  });

  //see if you can get this to render with Handlebars' {{each}}
  let teacherLessonsHTML = "";
  lessons.forEach((lesson) => {
    teacherLessonsHTML += Lesson.teacherLessonsTemplate(lesson);
  });

  $('.ui.comments').html(teacherLessonsHTML);
} 

Lesson.nextButtonClickListener = (event) => {
  event.preventDefault();

  Lesson.teacherLinkTemplate = Handlebars.compile(Lesson.teacherLinkSource);
  Lesson.tagsTemplate = Handlebars.compile(Lesson.tagsSource);
  Lesson.commentsTemplate = Handlebars.compile(Lesson.commentsSource);

  let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;
  
  $.get(`/lessons/${nextLessonId}.json`)
    .done(Lesson.success)
    .fail(Lesson.error);
}

Lesson.bindNextButtonClickListener = () => {
  $('.js-next').click(Lesson.nextButtonClickListener);
}

Lesson.viewLessonsClickListener = (event) => {
  event.preventDefault();

  Lesson.teacherLessonsTemplate = Handlebars.compile(Lesson.teacherLessonsSource);
  let id = $('.js-lessons').attr('data-id');

  $.get(`/teachers/${id}/lessons.json`)
    .done(Lesson.gotLessons)
    .fail(Lesson.error);
}

Lesson.bindViewLessonsClickListener = () => {
  $('.js-lessons').click(Lesson.viewLessonsClickListener);
}

Lesson.ready = () => {
  Lesson.bindNextButtonClickListener();
  Lesson.bindViewLessonsClickListener();

  Lesson.teacherLinkSource = $('#teacher-link-template').html();
  Lesson.tagsSource = $('#tags-template').html();
  Lesson.teacherLessonsSource = $('#teacher-lessons-template').html();
  Lesson.commentsSource = $('#comments-template').html();

}
 
$(() => {
  Lesson.ready();
});

