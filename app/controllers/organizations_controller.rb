  # This inherits from BusinessController, which is the Controller for
  # all Customer-related Business operations.
class OrganizationsController < BusinessController

  before_action :set_organization, only: [:edit, :update]

  # GET /organizations/1/edit
  def edit
  end

  # PATCH/PUT /organizations/1
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to customer_url, notice: 'Organization was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = @customer.organization # Customer has_one Organization
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :phone, :website, :customer_id)
    end
end
