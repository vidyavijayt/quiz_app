class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :choice
      t.text :description
      t.boolean :is_correct, default: false
      t.timestamps null: false
    end
  end
end
