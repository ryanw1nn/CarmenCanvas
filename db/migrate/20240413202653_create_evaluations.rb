class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.references :presentation_event, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
