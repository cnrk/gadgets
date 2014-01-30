class GadgetsController < ApplicationController

  def index
    @gadgets = Gadget.all
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)

    respond_to do |format|
      if @gadget.save
        format.html { redirect_to gadgets_path, notice: 'Gadget was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
