json.extract! person, :id, :first_name, :last_name, :string, :patronymic, :sex, :contact_phone, :created_at, :updated_at
json.url person_url(person, format: :json)
