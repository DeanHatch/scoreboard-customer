  # This inherits from BusinessController, which is the Controller for
  # all Customer-related Business operations.
class CreditsController < BusinessController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]


  # GET /customers/1/credits
  # GET /customers/1/credits.json
  def index
    @credits = Credit.all
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(credit_params)
    @credit.customer = @customer  # from session, not from params

    respond_to do |format|
      if @credit.save
        format.html { redirect_to customer_path, notice: 'Credit was successfully purchased.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to customer_path, notice: 'Credit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit.destroy
    respond_to do |format|
      format.html { redirect_to customer_credits_url(@customer), notice: 'Credit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:origin, :customer_id)
    end
end
