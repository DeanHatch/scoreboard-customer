class BusinessController < ApplicationController
  before_action :authenticate_customer!

    # Use callbacks to share common setup or constraints between actions.
  private
    def set_customer
      @customer = current_customer
    end
end
