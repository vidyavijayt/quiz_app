class Api::QuestionController < Api::ApiController
	# Api to retrieve question & choices
	def questions
		questions = Question.all
		render partial: 'api/questions/list', locals: {questions: questions}
	end
end