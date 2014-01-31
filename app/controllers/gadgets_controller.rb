class GadgetsController < ApplicationController

  before_action :check_current_user

  def index
    @gadgets = Gadget.search(params[:search], current_user.id)
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.user = current_user

    if @gadget.save
      redirect_to gadgets_path, notice: 'Gadget was successfully created.'
    else
      render action: 'new'
    end
  end

  private


  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
