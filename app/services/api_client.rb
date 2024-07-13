require 'rest-client'
require 'json'

class ApiClient
  if Rails.env.production?
    API_BASE_URL = ENV['DEBTOR_ADMIN_URL']
  else
    API_BASE_URL = 'http://localhost:3000'
  end

  def self.get_reports(lawsuit_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/reports?lawsuit_id=#{lawsuit_id}")
    response.body
    parsed_json = JSON.parse(response.body)
    parsed_json
  rescue RestClient::ExceptionWithResponse => e
    puts e.response 
  end

  def self.get_lawsuits(tenancy_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/lawsuits?tenancy_id=#{tenancy_id}")
    parsed_json = JSON.parse(response.body)
    parsed_json
  rescue RestClient::ExceptionWithResponse => e
    puts e.response
  end
  
  def self.get_companies(tenancy_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/companies?tenancy_id=#{tenancy_id}")
    response.body
  end
end