class AddQuizzToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :quizz, null: false, foreign_key: true
  end
end
