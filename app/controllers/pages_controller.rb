# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_subject
  before_action :find_page, only: %i[show edit update delete destroy]
  before_action :set_page_count, only: %i[edit update new create]
  before_action :confirm_login

  def index
    @pages = @subject.pages.sorted
  end

  def show; end

  def new
    @page = Page.new(
      name: 'New Page',
      subject_id: @subject.id,
      position: @page_count
    )
  end

  def create
    @page = Page.new(page_params)
    @page.subject = @subject

    if @page.save
      flash[:notice] = 'Page created successfully'
      redirect_to pages_path(subject_id: @subject.id)
    else
      render('new')
    end
  end

  def edit; end

  def update
    if @page.update page_params
      flash[:notice] = 'Page updated successfully'
      redirect_to page_path(@page, subject_id: @subject.id)
    else
      render 'edit'
    end
  end

  def delete; end

  def destroy
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully"
    redirect_to pages_path(subject_id: @subject.id)
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible)
  end

  def set_page_count
    @page_count = @subject.pages.count
    @page_count += 1 if %w[new create].include? params[:action]
  end

  def find_page
    @page = Page.find(params[:id])
  end

  def find_subject
    @subject = Subject.find params[:subject_id]
  end
end
