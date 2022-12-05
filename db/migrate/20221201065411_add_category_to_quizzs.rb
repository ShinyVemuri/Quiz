class AddCategoryToQuizzs < ActiveRecord::Migration[7.0]
  def change
    add_reference :quizzs, :category, foreign_key: true
  end
end
