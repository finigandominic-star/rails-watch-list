class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(@Lists)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def show
    @list = List.find(params[:id])
  end

def list_params
  params.require(:list).permit(:name, :image_url)
end

end
