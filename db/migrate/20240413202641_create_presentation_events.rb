class CreatePresentationEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :presentation_events do |t|
      t.string :title
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
