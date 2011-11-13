class GiftsController < ApplicationController

  def new
    if params[:vendor].present?
      @gift = Gift.new
    else
      @vendors = Vendor.available  
    end  

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @receiver = User.find_by_phone_number(params[:receiver][:phone_number])
    if @receiver.nil?
      @receiver = User.create(params[:receiver])
    end

    @giver = User.create(params[:giver])

    @gift = Gift.new params[:gift]

    @gift.vendor = Vendor.find(params[:vendor][:id])
    @gift.receiver = @receiver
    @gift.giver = @giver

    if @gift.save
      redirect_to gifts_path
    else
      @vendors = Vendor.available
      render :new
    end

  end

end
