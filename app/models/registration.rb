# frozen_string_literal: true
# == Schema Information
#
# Table name: registrations
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string           not null
#  last_name       :string           not null
#  sid             :string           not null
#  email           :string           not null
#  github_username :string           not null
#  repo_name       :string
#  slug            :string
#

class Registration < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sid, presence: true, uniqueness: true
  validates :email, email: true, presence: true, uniqueness: true
  validates :github_username, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :github_username, use: :slugged
end
