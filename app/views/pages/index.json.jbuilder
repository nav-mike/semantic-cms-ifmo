json.array!(@pages) do |page|
  json.id page.id
  json.uri page.uri
  json.name page.name
  json.path page.path
  json.short_content page.short_content
  json.title page.title
  json.html page.html
end
