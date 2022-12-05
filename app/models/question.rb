class Question < ApplicationRecord
    belongs_to :quizz
    has_one :answer
end
