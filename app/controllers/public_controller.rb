# frozen_string_literal: true

class PublicController < ApplicationController
  layout 'public'

  def index; end

  def show
    @page = Page.visible.where(permalink: params[:permalink]).first
    redirect_to root_path if @page.nil?
  end
end
