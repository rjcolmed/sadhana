# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
student1 = Student.create!(
  first_name: "Scully",
  username: "scully", 
  last_name: "Colon", 
  email: "scully@email.com",
  password: "111"
)

student2 = Student.create!(
  first_name: "Ricardo", 
  last_name: "Colon",
  username: "ricardo",
  email: "ricardo@email.com",
  password: "111",
  password_confirmation: "111"
)

teacher1 = Teacher.create!(
  first_name: "Caroline", 
  last_name: "McEneaney",
  username: "caro", 
  email: "caro@email.com",
  password: "111",
  password_confirmation: "111"
  
)

teacher2 = Teacher.create!(
  first_name: "Jomney", 
  last_name: "Bimbert",
  username: "jomney",
  email: "jomney@email.com",
  password: "111",
  password_confirmation: "111"
)

lesson1 = Lesson.create!(
  title: "Vinyasa for Beginners", 
  description: "This class is for beginners.",
  location: "123 Broadway",
  teacher_id: teacher1.id
)

lesson2 = Lesson.create!(
  title: "Advanced Vinyasa", 
  description: "This class is for experienced practioners.",
  location: "8 2nd Ave.",
  teacher_id: teacher2.id
)

lesson3 = Lesson.create!(
  title: "Sanskrit for Beginners", 
  description: "We'll learn the basics.",
  location: "123 Broadway",
  teacher_id: teacher1.id
)

