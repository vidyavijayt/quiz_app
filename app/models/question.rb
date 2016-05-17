class Question < ActiveRecord::Base
	has_many :choices, dependent: :destroy
end
