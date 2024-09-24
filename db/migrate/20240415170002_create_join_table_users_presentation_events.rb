class CreateJoinTableUsersPresentationEvents < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :presentation_events do |t|
      # t.index [:user_id, :presentation_event_id]
      # t.index [:presentation_event_id, :user_id]
    end
  end
end
