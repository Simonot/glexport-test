class Api::V1::ShipmentsController < Api::V1::ApplicationController
  include BasicErrorRendering

  before_action :find_company_and_shipments
  before_action :sort_filter_params

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

    def sort_filter_params
      if params[:international_transportation_mode]
        @shipments = @shipments.where(international_transportation_mode: params[:international_transportation_mode])
      end
      if params[:sort]
        invalid_params!('sort', params[:sort]) and return unless params[:sort] == 'international_departure_date'
        invalid_params!('direction', params[:direction]) and return unless ['asc', 'desc'].include?(params[:direction])
        @shipments = @shipments.order(params[:sort].to_sym => params[:direction].to_sym)
      end
    end
end
