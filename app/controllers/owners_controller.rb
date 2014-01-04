class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to owners_path, notice: 'Owner successfully saved'
    else
      render :new
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
