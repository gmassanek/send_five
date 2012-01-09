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
    phone_number = "+1" + params[:receiver][:area_code] + params[:receiver][:phone_number1] + params[:receiver][:phone_number2]
    @receiver = User.find_by_phone_number(phone_number)
    #    @receiver = User.find_by_phone_number(params[:receiver][:phone_number])
    if @receiver.nil?
      @receiver = User.new
      @receiver.phone_number = phone_number
      @receiver.first_name = params[:receiver][:first_name]
      @receiver.save
    end

    @giver = User.create(params[:giver])

    @gift = Gift.new params[:gift]

    @gift.vendor = Vendor.find(params[:vendor][:id])
    @gift.receiver = @receiver
    @gift.giver = @giver

    if @gift.save
      redirect_to gift_path(@gift)
    else
      @vendors = Vendor.available
      render :new
    end
  end
  
  def show
    @gift = Gift.find(params[:id].to_i)
  end

  def pay_for_gift
    @gift = Gift.find(params[:id])
    token = params[:stripeToken]
    Stripe.api_key = ENV['stripe_api_key']
    charge = Stripe::Charge.create(
      :amount => 599, # amount in cents, again
      :currency => "usd",
      :card => token,
      :description => @gift.id
    )
    @gift.send_texts 
    redirect_to new_user_url
  end

end 

