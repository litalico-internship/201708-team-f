json.extract! reservation, :id, :user_id, :adviser_id, :start_time, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
