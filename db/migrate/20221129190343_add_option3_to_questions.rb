class AddOption3ToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option3, :string
  end
end
