# frozen_string_literal: true

class DemoController < ApplicationController
  layout false

  def index
    render 'index'
  end

  def hello
    @array = [*(1..5)]
    @id = params[:id].to_i
    @page = params[:page].to_i
    render 'hello'
  end

  def other_hello
    redirect_to(action: 'hello')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

  def escape_output
    # Escape output
  end
end
