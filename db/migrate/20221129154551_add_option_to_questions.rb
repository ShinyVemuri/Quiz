class AddOptionToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option, :string
  end
end
