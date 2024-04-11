json.data do
  @earthquakes.each do |earthquake|
    json.child! do
      json.id earthquake.id
      json.type 'feature'
      json.attributes do
        json.external_id earthquake.externa_id
        json.magnitude earthquake.magnitude
        json.place earthquake.place
        json.time earthquake.time.to_s
        json.tsunami earthquake.tsunami
        json.mag_type earthquake.mag_type
        json.title earthquake.title
        json.coordinates do
          json.array! [earthquake.longitude.to_f, earthquake.latitude.to_f]
        end
      end
      json.links do
        json.external_url earthquake.external_url
      end
    end
  end
end

json.pagination do
  json.current_page 1
  json.total @earthquakes.count
  json.per_page 10
end
# json.extract! earthquake, :id, :latitude, :longitude, :title, :mag_type, :tsunami, :time, :place, :magnitude, :externa_id, :type, :created_at, :updated_at
# json.url earthquake_url(earthquake, format: :json)
