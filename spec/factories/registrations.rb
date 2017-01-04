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
#  slug            :string
#

FactoryGirl.define do
  factory :registration do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    sequence(:sid) { |n| 10_000_000 + n }
    sequence(:email) { |n| "test#{n}@berkeley.edu" }
    sequence(:github_username) { |n| "test#{n}" }
  end
end
