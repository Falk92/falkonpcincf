class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id])
    begin
      charge = Stripe::Charge.create(
        :amount => 20000, # amount in cents
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(product)
  end
end
