# frozen_string_literal: true

# The Controller for all of our subjects
class SubjectsController < ApplicationController
  before_action :find_subjects, only: [:index]
  before_action :find_subject, only: %i[show edit update delete destroy]
  before_action :set_subject_count, only: %i[edit update new create]
  before_action :confirm_login

  def index
    logger.debug('### Testing the logger. ###')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(
      position: @subject_count
    )
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = 'Subject created successfully'
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = 'Error saving page'
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Instantiate a new object using form parameters
    @subject = Subject.find(params[:id])
    # Save the object
    if @subject.update(subject_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = 'Subject updated successfully'
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = 'Error saving page'
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def find_subject
    @subject = Subject.find params[:id]
  end

  def set_subject_count
    @subject_count = Subject.count
    @subject_count += 1 if %w[new create].include? params[:action]
  end
end
