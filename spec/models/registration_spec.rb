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
#  sid             :integer          not null
#  email           :string           not null
#  github_username :string           not null
#  repo_name       :string
#

require 'rails_helper'

RSpec.describe Registration, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :sid }
  it { should validate_uniqueness_of :sid }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :github_username }
  it { should validate_uniqueness_of :github_username }
end
