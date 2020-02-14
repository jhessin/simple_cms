# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'

  before_action :setup_navigation

  def confirm_login
    return if session[:user_id]

    flash[:notice] = 'Please log in.'
    redirect_to access_login_path
    # redirect_to prevents requested action from running
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end
end
