class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :description
      t.timestamps null: false
    end
  end
end
