class PaymentsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @user = current_user
        token = params[:stripeToken]
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
            charge = Stripe::Charge.create(
            :amount => (@product.price * 100).to_i,
            :currency => "gbp",
            :source => token,
            :description => params[:stripeEmail]
            )
        if charge.paid
            Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        end
        
        rescue Stripe::CardError => e
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        
        respond_to do |format|
        format.html { redirect_to @product, notice: 'Thankyou for your purchase.' }
        format.json { render :show, status: :ok, location: @product }
        end
        
    end
end
