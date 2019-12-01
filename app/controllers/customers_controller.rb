class CustomersController < BusinessController
  before_action :authenticate_customer!
  before_action :set_customer

  # GET /customer
  def show
  end

end
