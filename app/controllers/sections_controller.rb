# frozen_string_literal: true

class SectionsController < ApplicationController
  before_action :find_sections, only: [:index]
  before_action :find_section, only: %i[show edit update delete destroy]
  before_action :set_section_count, only: %i[edit update new create]
  before_action :confirm_login

  def index; end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new section_params

    if @section.save
      flash[:notice] = 'Section created successfully'
      redirect_to sections_path
    else
      flash[:error] = 'Error creating section'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @section.update section_params
      flash[:notice] = 'Section updated successfully'
      redirect_to section_path(@section)
    else
      flash[:error] = 'Error updating section'
      render 'edit'
    end
  end

  def delete; end

  def destroy
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' deleted successfully"
    redirect_to sections_path
  end

  private

  def section_params
    params.require(:section).permit(:name, :page_id, :position, :visible,
                                    :content_type, :content)
  end

  def find_sections
    @sections = Section.sorted
  end

  def find_section
    @section = Section.find(params[:id])
  end

  def set_section_count
    @section_count = Section.count
    @section_count += 1 if %w[new create].include? params[:action]
  end
end
