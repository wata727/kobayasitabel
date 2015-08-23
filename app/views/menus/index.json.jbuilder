json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :eat
  json.url menu_url(menu, format: :json)
end
