class AddOption2ToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option2, :string
  end
end
