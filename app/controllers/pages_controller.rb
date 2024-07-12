class PagesController < ApplicationController
  def index
  end

  def lawsuits
    lawsuits = ApiClient.get_lawsuits(ENV['TENANCY_ID'])
    @bankruptcies = lawsuits.select { |lawsuit| lawsuit['category'] == 'bankruptcy' }
    @judicial_recoveries = lawsuits.select { |lawsuit| lawsuit['category'] == 'judicial_recovery' }
  end
end
