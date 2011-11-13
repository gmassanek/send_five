class GiftsController < ApplicationController

  def new
    @gift = Gift.new
    @vendors = Vendor.available
  end

  def create
    @gift = Gift.new params[:gift]
    @gift.vendor = Vendor.find_by_id params[:vendor][:id]
    if @gift.save
      redirect_to gifts_path
    else
      @vendors = Vendor.available
      render :new
    end

  end

end
