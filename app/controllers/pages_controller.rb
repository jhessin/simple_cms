# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(
      name: 'New Page'
    )
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = 'Page created successfully'
      redirect_to pages_path
    else
      flash[:error] = 'Error saving page'
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update page_params
      flash[:notice] = 'Page updated successfully'
      redirect_to page_path(@page)
    else
      flash[:error] = 'Error saving page'
      render 'edit'
    end
  end

  def delete
    @page = Page.find params[:id]
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully"
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible,
                                 :subject_id)
  end
end
