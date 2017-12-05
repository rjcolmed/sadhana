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
   //this is where I should replace pieces of the page. need to preserve rails's stuff when I dynamically render stuff
   let lesson = new Lesson(json);
  //  let lessonHTML = lesson.renderHTML(); //expand on this to render the pieces of html you need
 
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
    let nextLessonId = parseInt($('.js-next').attr('data-id')) + 1;
   
    $.get(`/lessons/${nextLessonId}.json`)
      .done(Lesson.success)
      .fail(Lesson.error);
 }
 
 Lesson.bindNextButtonClickListener = () => {
   $('.js-next').click(Lesson.nextButtonClickListener);
 }
 
 Lesson.ready = () => {
   Lesson.teacherLinkSource = $('#teacher-link-template').html();
   Lesson.teacherLinkTemplate = Handlebars.compile(Lesson.teacherLinkSource);
   Lesson.tagsSource = $('#tags-template').html();
   Lesson.tagsTemplate = Handlebars.compile(Lesson.tagsSource);
   Lesson.bindNextButtonClickListener();
 }
 
 $(() => {
   Lesson.ready();
 });

