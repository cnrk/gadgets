class ImagesController < ApplicationController

  before_action :check_current_user

  def new
    @image = Image.new
    unless params[:gadget_id]
      redirect_to root_path, error: "No gadget id specified."
      return
    end
    @gadget = Gadget.find(params[:gadget_id])
  end

  def create
    @image = Image.new(file: params[:image][:file], gadget_id: params[:image][:gadget_id])
    @image.save!
    redirect_to gadgets_path, notice: "Image has been added."
  end

end
