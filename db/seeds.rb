# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create([
	{ question: 'Who is the Prime Minister of India?', description: 'Question description'},
	{ question: 'Entomology is the science that studies', description: 'Question description'},
	{ question: 'FFC stands for', description: 'Question description'},
	{ question: 'Epsom (England) is the place associated with', description: 'Question description'},
	{ question: 'Golf player Vijay Singh belongs to which country?', description: 'Question description'}])

Choice.create([
	{ choice: 'Manmohan Singh', description: 'Option 1', is_correct: false, question_id: questions[0].id },
	{ choice: 'Pranab Mukharjee', description: 'Option 2', is_correct: false, question_id: questions[0].id },
	{ choice: 'Narendra Modi', description: 'Option 3', is_correct: true, question_id: questions[0].id },
	{ choice: 'Prathibha Pateel', description: 'Option 4', is_correct: false, question_id: questions[0].id }])

Choice.create([
	{ choice: 'Behavior of human beings', description: 'Option 1', is_correct: false, question_id: questions[1].id },
	{ choice: 'Insects', description: 'Option 2', is_correct: true, question_id: questions[1].id },
	{ choice: 'The origin and history of technical and scientific terms', description: 'Option 3', is_correct: false, question_id: questions[1].id },
	{ choice: 'The formation of rocks', description: 'Option 4', is_correct: false, question_id: questions[1].id }])

Choice.create([
	{ choice: 'Foreign Finance Corporation', description: 'Option 1', is_correct: false, question_id: questions[2].id },
	{ choice: 'Film Finance Corporation', description: 'Option 2', is_correct: true, question_id: questions[2].id },
	{ choice: 'Federation of Football Council', description: 'Option 3', is_correct: false, question_id: questions[2].id },
	{ choice: 'None of the above', description: 'Option 4', is_correct: false, question_id: questions[2].id }])

Choice.create([
	{ choice: 'Horse racing', description: 'Option 1', is_correct: true, question_id: questions[3].id },
	{ choice: 'Polo', description: 'Option 2', is_correct: false, question_id: questions[3].id },
	{ choice: 'Shooting', description: 'Option 3', is_correct: false, question_id: questions[3].id },
	{ choice: 'Snooker', description: 'Option 4', is_correct: false, question_id: questions[3].id }])

Choice.create([
	{ choice: 'USA', description: 'Option 1', is_correct: false, question_id: questions[4].id },
	{ choice: 'Fiji', description: 'Option 2', is_correct: true, question_id: questions[4].id },
	{ choice: 'India', description: 'Option 3', is_correct: false, question_id: questions[4].id },
	{ choice: 'UK', description: 'Option 4', is_correct: false, question_id: questions[4].id }])
