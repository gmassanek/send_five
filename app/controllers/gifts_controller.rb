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
      redirect_to gift_path(@gift)
    else
      @vendors = Vendor.available
      render :new
    end
  end
  
  def show
    @gift = Gift.find(params[:id].to_i)
  end

  def send_to_paypal
    @gift = Gift.find(params[:id])
    redirect_to @gift.paypal_url(new_user_url, @gift.id, paypal_listener_url) 
  end

  #def receive_from_paypal
  #  @gift = Gift.find(params[:item_number])
  #  if params[:payment_status] == "Completed"
  #    @gift.send_texts
  #    redirect_to new_user_url
  #  else
  #    redirect_to root_url
  #    flash[:notice] = "There was an error with your payment. Please try again."
  #  end
  #end

  def paypal_listener
    @gift = Gift.find(params[:item_number])
    if params[:payment_status] == "Completed" && @gift.sent == false
      @gift.send_texts
      @gift.sent = true
      render :nothing => true
    else
      render :nothing => true      
     end
  end
      ##RestClient.post "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate", :params => paypal_details 
      #uri = URI.parse("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate")

      #http = Net::HTTP.new(uri.host, uri.port)
      #http.open_timeout = 60
      #http.read_timeout = 60
      #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      #http.use_ssl = true
      #response = http.post(uri.request_uri, paypal_details,
      #                     'Content-Length' => "#{paypal_details.size}"
      #                    ).body
      #puts response.inspect

      #redirect_to root_url

     # reply_to_paypal = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate" + params.to_query 

     # redirect_to reply_to_paypal
    #end
end  



