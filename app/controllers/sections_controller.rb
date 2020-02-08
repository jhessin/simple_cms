# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def delete
    @section = Section.find params[:id]
  end

  def show
    @section = Section.find params[:id]
  end

  def edit
    @section = Section.find params[:id]
  end

  def new
    @section = Section.find params[:id]
  end
end
