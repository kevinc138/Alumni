json.array!(@alumnus) do |alumnu|
  json.extract! alumnu, :id, :firstname, :lastname, :gradyear, :email, :address, :major
  json.url alumnu_url(alumnu, format: :json)
end
