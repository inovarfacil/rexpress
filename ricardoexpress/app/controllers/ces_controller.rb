class CesController < ApplicationController
  def index
    @ces = Ce.order(:city).where("city like ?", "%#{params[:term]}%")
    render :json => @ces.map { |i| "#{i.city}" }
  end
end
