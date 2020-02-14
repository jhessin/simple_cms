# frozen_string_literal: true

class AccessController < ApplicationController
  before_action :confirm_login, except: %i[login attempt_login logout]

  def menu
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    authorized_user = fetch_user
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = 'You are now logged in'
      redirect_to admin_path
    else
      flash.now[:notice] = 'Invalid username/password comination.'
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to access_login_path
  end

  private

  def fetch_user
    return if params[:username].empty? || params[:password].empty?

    found_user = AdminUser.where(username: params[:username]).first
    found_user&.authenticate params[:password]
  end
end
