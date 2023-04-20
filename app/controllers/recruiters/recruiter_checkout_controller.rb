class Recruiters::RecruiterCheckoutController < ApplicationController
    def create
      @session = Stripe::Checkout::Session.create({
          payment_method_types: ['card'],
          customer_email: current_user.email,
          line_items: [{
            price_data: {currency: 'inr', product_data: {name: 'Premium'}, unit_amount: 20000},
            quantity: 1,
          }],
          mode: 'payment',
          success_url: recruiter_index_url,
          cancel_url: recruiter_index_url,
        })

        respond_to do |format|
          format.js
        end
        
    end
end
