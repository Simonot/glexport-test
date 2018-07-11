class ApplicationController < ActionController::API
  # rescue_from ActionController::ParameterMissing do |exception|
  #   bad_request! exception.message
  # end

  def route_not_found
    render json: {message: "Not Found", errors: "Route not found"}, status: :not_found, location: nil
  end

#  def paginate items, model
#     return_items = items.page(params[:page]).per(params[:per_page])
#    set_pagination return_items.total_count, model.default_per_page
#    return_items
#  end
#
#  def set_pagination total, default_per_page=10
#    @pagination = {
#      per_page: params[:per_page].nil? ? default_per_page :  params[:per_page].to_i,
#     page: params[:page].nil? ? 1 : params[:page].to_i,
#      total: total
#    }
#  end
end
