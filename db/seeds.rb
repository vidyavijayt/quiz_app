# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question = Question.create({ question: 'Who is the Prime Minister of India?', description: 'Question description'})
Choice.create([
	{ choice: 'Manmohan Singh', description: 'Option 1', is_correct: false, question_id: question.id },
	{ choice: 'Pranab Mukharjee', description: 'Option 2', is_correct: false, question_id: question.id },
	{ choice: 'Narendra Modi', description: 'Option 3', is_correct: true, question_id: question.id },
	{ choice: 'Prathibha Pateel', description: 'Option 4', is_correct: false, question_id: question.id }])
