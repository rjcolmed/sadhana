class Lesson {
  constructor(json) {
     this.id = json.id;
     this.title = json.title;
     this.location = json.location;
     this.time = json.time;
     this.description = json.description;
     this.teacher = json.teacher;
     this.tags = json.tags;
   }

   teacherName() {
     return `${this.teacher.first_name} ${this.teacher.last_name}`
   }
 }
 
 Lesson.success = (json) => {
   let lesson = new Lesson(json);
 
   $('#lessonTitle').text(lesson.title);
   $('#lessonDescription').text(lesson.description);
   $('#lessonLocation').text(lesson.location);
   $('#lessonTime').text(lesson.time);
   $('#lessonTeacherImage').attr('src', lesson.teacher.image);

   let teacherLinkHTML = Lesson.teacherLinkTemplate(lesson);
   $('#lessonTeacherName').html(teacherLinkHTML);

   let tagsHTML = Lesson.tagsTemplate(lesson);
   $('#lessonTags').html(tagsHTML);

   $(".js-next").attr('data-id', lesson.id);
 }
 
  Lesson.error = (err) => {
    console.log(err);
  }

  Lesson.nextButtonClickListener = (event) => {
    event.preventDefault();
    Lesson.teacherLinkTemplate = Handlebars.compile(Lesson.teacherLinkSource);
    Lesson.tagsTemplate = Handlebars.compile(Lesson.tagsSource);
    let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;
    
    $.get(`/lessons/${nextLessonId}.json`)
      .done(Lesson.success)
      .fail(Lesson.error);
  }

  Lesson.bindNextButtonClickListener = () => {
    console.log('been bound next button');
    $('.js-next').click(Lesson.nextButtonClickListener);
  }

  Lesson.viewLessonsClickListener = (event) => {
    event.preventDefault();
    
  }

  Lesson.bindViewLessonsClickListener = () => {
    $('.js-lessons').click(Lesson.viewLessonsClickListener);
  }



  Lesson.ready = () => {

    Lesson.teacherLinkSource = $('#teacher-link-template').html();
    Lesson.tagsSource = $('#tags-template').html();
    

    Lesson.bindNextButtonClickListener();
    Lesson.bindViewLessonsClickListener();

 }
 
$(() => {
  Lesson.ready();
});

