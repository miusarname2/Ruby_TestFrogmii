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
          json.longitude earthquake.longitude
          json.latitude earthquake.latitude
        end
      end
      json.links do
        json.external_url earthquake_url(earthquake, format: :json)
      end
    end
  end
end

json.pagination do
  json.current_page 1
  json.total @earthquakes.count
  json.per_page 10
end
