class AddQuizzToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :quizz, foreign_key: true
  end
end
