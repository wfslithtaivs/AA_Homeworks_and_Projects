class SubsController < ApplicationController
  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render "new"
    end
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render "edit"
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def destroy

  end

  private
  def sub_params
    params.require(:sub).require(:title, :description)
  end
end
