json.array!(@dailydesignerapps) do |dailydesignerapp|
  json.extract! dailydesignerapp, :id, :name, :sex, :state, :city
  json.url dailydesignerapp_url(dailydesignerapp, format: :json)
end
