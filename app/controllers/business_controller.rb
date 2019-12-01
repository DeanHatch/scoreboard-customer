class BusinessController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

    # Use callbacks to share common setup or constraints between actions.
  private
    def set_customer
      @customer = current_customer
      puts "Customer set to "+@customer.inspect()
    end
end
