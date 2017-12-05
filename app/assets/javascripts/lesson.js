class Lesson {
  constructor(json) {
    this.id = json.id;
    this.title = json.title;
    this.time = json.time;
    this.description = json.description;
    this.teacher = json.teacher;
    this.tags = json.tags;
  }

  teacherName() {
    return `${this.teacher.first_name} ${this.teacher.last_name}`
  }

  
}