class AddOption4ToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option4, :string
  end
end
