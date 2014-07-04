class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :completed_survey_id
      t.integer :choice_id
      t.timestamps
    end
  end
end
