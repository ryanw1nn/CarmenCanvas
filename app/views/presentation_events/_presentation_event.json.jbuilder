json.extract! presentation_event, :id, :title, :date, :description, :created_at, :updated_at
json.url presentation_event_url(presentation_event, format: :json)
