# frozen_string_literal: true

# The Controller for all of our subjects
class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
    # render('index')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(
      name: 'New Subject Name'
    )
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @subject = Subject.find(params[:id])
    # Save the object
    if @subject.update(subject_params)
      # If save succeeds, redirect to the index action
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
