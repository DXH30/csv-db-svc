require 'sinatra'
require 'csv'
require 'json'
require 'net/http'
require 'uri'

set :bind, '0.0.0.0'
report_service_url = ENV["REPORT_SERVICE_API"] || "service-svc:5000"
api_url = URI.parse("http://#{report_service_url}/convert")
get '/find' do
  email = params[:email]
  start_date = params[:start_date]
  end_date = params[:end_date]
  data = read_data_from_csv('db.csv')
  filtered_data = filter_data(data, email, start_date, end_date)
  if filtered_data.empty?
    status 404
    return { error: 'No matching records found' }.to_json
  end
  content_type :json
  http = Net::HTTP.new(api_url.host, api_url.port)
  request = Net::HTTP::Post.new(api_url.path)
  content = convert_to_csv(filtered_data)
  request.set_form_data('email' => email, 'content' => content)
  response = http.request(request)
  return { message: "Success creating report for #{email} from #{start_date} to #{end_date}" }.to_json
rescue StandardError => e
  return { message: e, status: "error" }.to_json
end

def read_data_from_csv(file_path)
  data = []
  CSV.foreach(file_path, headers: true) do |row|
    data << row.to_h
  end
  data
end
def filter_data(data, email, start_date, end_date)
  filtered_data = data
  filtered_data = filtered_data.select { |record| record['date'] >= start_date } if start_date
  filtered_data = filtered_data.select { |record| record['date'] <= end_date } if end_date
  filtered_data = filtered_data.select { |record| record['email'] == email } if email
  filtered_data
end
def convert_to_csv(data)
  column_names = data.first.keys
  s=CSV.generate do |csv|
    csv << column_names
    data.each do |x|
      csv << x.values
    end
  end
  s
end
