class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = current_user.organizations.build

  end

  def show
    @organization = Organization.find_by(id: params[:id])
  end



  private

  def organization_params
    params.require(:organization).permit(:name)
  end



end
