json.array!(@diaries) do |diary|
  json.extract! diary, :id
  json.url diary_url(diary, format: :json)
end
