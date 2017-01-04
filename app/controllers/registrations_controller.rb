# frozen_string_literal: true
class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new registration_params

    binding.pry
  end

  def show
  end

  private

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :sid, :email, :github_username
    )
  end
end
