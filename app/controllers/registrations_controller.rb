# frozen_string_literal: true
class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new registration_params
    create_github_repo = CreateGithubRepo.new(
      registration: @registration,
      repo_num: Registration.count + 1,
    )

    if @registration.valid? && create_github_repo.valid?
      create_github_repo.execute

      @registration.repo_name = create_github_repo.repo_name
      @registration.save

      redirect_to @registration
    else
      render :new
    end
  end

  def show
    @registration = Registration.friendly.find params[:id]
  end

  private

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :sid, :email, :github_username
    )
  end
end
