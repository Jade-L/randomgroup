json.array!(@personnes) do |personne|
  json.extract! personne, :id, :nom, :email, :tel, :group_id, :sensei
  json.url personne_url(personne, format: :json)
end
