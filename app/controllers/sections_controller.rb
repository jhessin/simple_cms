# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new section_params

    if @section.save
      flash[:notice] = 'Section created successfully'
      redirect_to section_path(@section)
    else
      flash[:error] = 'Error creating section'
      render 'new'
    end
  end

  def show
    @section = Section.find params[:id]
  end

  def edit
    @section = Section.find params[:id]
  end

  def update
    @section = Section.find params[:id]

    if @section.update section_params
      flash[:notice] = 'Section updated successfully'
      redirect_to section_path(@section)
    else
      flash[:error] = 'Error updating section'
      render 'edit'
    end
  end

  def delete
    @section = Section.find params[:id]
  end

  def destroy
    @section = Section.find params[:id]

    @section.destroy
    flash[:notice] = "Section '#{@section.name}' deleted successfully"
    redirect_to sections_path
  end

  private

  def section_params
    params.require(:section).permit(:name, :page_id, :position, :visible,
                                    :content_type, :content)
  end
end
