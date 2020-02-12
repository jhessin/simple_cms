# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_pages, only: [:index]
  before_action :find_page, only: %i[show edit update delete destroy]
  before_action :set_page_count, only: %i[edit update new create]

  def index; end

  def show; end

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
      render('new')
    end
  end

  def edit; end

  def update
    if @page.update page_params
      flash[:notice] = 'Page updated successfully'
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def delete; end

  def destroy
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully"
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible,
                                 :subject_id)
  end

  def find_pages
    @pages = Page.sorted
  end

  def set_page_count
    @page_count = Page.count
    @page_count += 1 if %w[new create].include? params[:action]
  end

  def find_page
    @page = Page.find(params[:id])
  end
end
