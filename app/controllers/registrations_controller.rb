# frozen_string_literal: true
class RegistrationsController < ApplicationController
  before_action :redirect_if_exists, only: :create

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

  def redirect_if_exists
    username = registration_params[:github_username]
    registration_exists = Registration
                          .where(github_username: username)
                          .any?

    if registration_exists
      redirect_to Registration.find_by github_username: username
    end
  end

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :sid, :email, :github_username
    )
  end
end
