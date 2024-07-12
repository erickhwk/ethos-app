require 'rest-client'
require 'json'

class ApiClient
  API_BASE_URL = 'https://rails-production-d750.up.railway.app/'

  def self.get_reports(tenancy_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/reports?tenancy_id=#{tenancy_id}")
    response.body
  end

  def self.get_lawsuits(tenancy_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/lawsuits?tenancy_id=#{tenancy_id}")
    parsed_json = JSON.parse(response.body)
    parsed_json
  rescue RestClient::ExceptionWithResponse => e
    # Em caso de erro, exibir a resposta do erro
    puts e.response
  end

  def self.get_companies(tenancy_id)
    response = RestClient.get("#{API_BASE_URL}/api/v1/companies?tenancy_id=#{tenancy_id}")
    response.body
  end
end