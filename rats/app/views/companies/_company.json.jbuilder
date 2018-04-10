json.extract! company, :id, :name, :headquarters, :website, :size, :synopsis, :founded, :industry, :revenue, :created_at, :updated_at
json.url company_url(company, format: :json)
