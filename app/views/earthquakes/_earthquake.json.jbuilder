json.extract! earthquake, :id, :latitude, :longitude, :title, :mag_type, :tsunami, :time, :place, :magnitude, :externa_id, :type, :created_at, :updated_at
json.url earthquake_url(earthquake, format: :json)
