if questions.present?
	json.questions questions.each do |qn|
		json.id qn.id
		json.question qn.question
		json.description qn.description
		json.answers qn.choices.each do |choice|
			json.choice choice.choice
			json.choice_desc choice.description
			json.is_correct choice.is_correct
		end
	end
end

json.message "The list of questions"
json.status STATUS[:success]
