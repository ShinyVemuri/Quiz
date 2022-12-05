class Quizz < ApplicationRecord
    has_many :questions
    has_one :answer
end
