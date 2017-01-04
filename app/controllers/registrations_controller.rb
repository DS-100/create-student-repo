# frozen_string_literal: true
class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new registration_params

    if @registration.valid?
      create_github_repo = CreateGithubRepo.new @registration.github_username

      unless create_github_repo.user_exists?
        @registration.errors.add(
          :github_username,
          "This username does not exist on Github. Double check that you " +
          "entered in the correct username."
        )
        render :new and return
      end

      @registration.save
      create_github_repo.execute @registration.id

      redirect_to @registration
    else
      render :new
    end
  end

  def show
    @registration = Registration.find params[:id]
  end

  private

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :sid, :email, :github_username
    )
  end
end
