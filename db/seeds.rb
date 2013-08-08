User.create(name: 'ryan', email: 'ryan@ryan.com', password: 'ryan')
User.create(name: 'mark', email: 'mark@mark.com', password: 'mark')
Question.create(title: 'About git hub', text: "Why can't you guys keep it clean!", user_id: 2)
Question.create(title: "I'm 6'5\"", text: "Yet people keep thinking I'm 6'3\"", user_id: 1)
Answer.create(text: "That's because you are often sitting.", user_id: 2, question_id: 2)
Answer.create(text: "We don't have your magic git touch, and mad skills.", user_id: 1, question_id: 1)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
