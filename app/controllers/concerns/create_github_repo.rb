# frozen_string_literal: true
class CreateGithubRepo
  ORGANIZATION = 'DS-100'

  def initialize(registration:, repo_num:)
    @gh_client = Octokit::Client.new access_token: ENV['github_token']

    @registration = registration
    @repo_num = repo_num
  end

  def valid?
    @gh_client.user @registration.github_username
  rescue Octokit::NotFound
    @registration.errors.add(
      :github_username,
      "This username does not exist on Github. Double check that you " \
      "entered in the correct username.",
    )
    false
  end

  def repo_name
    # Returns a string like s0042
    "s#{@repo_num.to_s.rjust(4, '0')}"
  end

  # Note that this method has no error handling if something goes wrong on the
  # Github end. This means stuff can go wrong if this method gets interrupted
  # but for simplicity's sake we'll just leave this as it is and handle messed
  # up cases manually.
  def execute
    create_repo repo_name
    add_user_to_repo repo_name
  end

  def create_repo(repo_name)
    @gh_client.create_repo(
      repo_name,
      organization: ORGANIZATION,
      private: true,
    )
  end

  def add_user_to_repo(repo_name)
    @gh_client.add_collaborator "#{ORGANIZATION}/#{repo_name}", @username
  end
end
