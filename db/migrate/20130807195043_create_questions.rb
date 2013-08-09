class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string     :title
      t.text       :text
      t.belongs_to :user

      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end


