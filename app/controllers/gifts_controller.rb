class GiftsController < ApplicationController

  def new
    @gift = Gift.new
    @vendors = Vendor.available
  end

  def create
    @gift = Gift.new params[:gift]
    @gift.code = Code.available.where(:vendor_id => params[:vendor][:id]).first
    if @gift.save
      redirect_to gifts_path
    else
      render :new
    end

  end

end
