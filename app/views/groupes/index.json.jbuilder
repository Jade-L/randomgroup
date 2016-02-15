json.array!(@groupes) do |groupe|
  json.extract! groupe, :id, :nom, :salle, :tache
  json.url groupe_url(groupe, format: :json)
end
