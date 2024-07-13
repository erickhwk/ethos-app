class LawsuitsController < ApplicationController
  def index
    lawsuits = ApiClient.get_lawsuits(ENV['TENANCY_ID'])
    @bankruptcies = lawsuits.select { |lawsuit| lawsuit['category'] == 'bankruptcy' }
    @judicial_recoveries = lawsuits.select { |lawsuit| lawsuit['category'] == 'judicial_recovery' }
  end

  def show
    lawsuits = ApiClient.get_lawsuits(ENV['TENANCY_ID'])
    @lawsuit = lawsuits.find { |lawsuit| lawsuit['id'] == params[:id].to_i }
    @reports = ApiClient.get_reports(params[:id])
  end
end
