class Api::V1::ShipmentsController < Api::V1::ApplicationController
  include BasicErrorRendering

  before_action :find_company_and_shipments

  def index
  end

  private

    def find_company_and_shipments
      if params[:company_id].present?
      company = Company.find(params[:company_id])
      @shipments = Shipment.where(company_id: company.id)
      else
        no_company_provided!
      end
    rescue ActiveRecord::RecordNotFound
      not_found! 'Company', params[:company_id]
    end
end
