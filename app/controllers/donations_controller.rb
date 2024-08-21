class DonationsController < ApplicationController
  before_action :authenticate_user!

  def by_organization
  end

  def index
    @donations = current_user.donations
  end

  def new
    @donation = current_user.donations.build

  end

  def show
    @donation = current_user.donations.find_by(id: params[:id])
  end

  def create
    @donation = current_user.donations.build(donation_params)
    if @donation.save
      redirect_to user_donation_path(@donation.user, @donation)
    else
      render :new
    end
  end

  def edit
    @donation = current_user.donations.find_by(id: params[:id])
  end

  def update
    @donation = current_user.donations.find_by(id: params[:id])
    @donation.update(donation_params)
    if @donation.save
      redirect_to user_donation_path(@donation.user, @donation)
    else
      render :edit
    end
  end

  def destroy
    @donation = current_user.donations.find_by(id: params[:id])
    @donation.delete
      flash[:notice] = "Donation deleted."
      redirect_to user_donations_path(current_user)
  end


  private

  def donation_params
    params.require(:donation).permit(:date, :amount, :honoree, :comments, :user_id, :organization_id, organization_attributes: [:name])
  end


end
