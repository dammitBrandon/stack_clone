class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.belongs_to :question
      t.belongs_to :tag

      t.timestamps
    end
  end
end
