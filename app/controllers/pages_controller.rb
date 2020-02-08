# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def delete; end

  def show; end

  def edit; end

  def new; end
end
