# frozen_string_literal: true
class CreateGithubRepo
  ORGANIZATION = 'DS-100'

  def initialize(registration:)
    @gh_client = Octokit::Client.new access_token: ENV['github_token']

    @registration = registration
  end

  def valid?
    @gh_client.user @registration.github_username
  rescue Octokit::NotFound => e
    Rollbar.info e
    @registration.errors.add(
      :github_username,
      "This username does not exist on Github. Double check that you " \
      "entered in the correct username.",
    )
    false
  rescue Faraday::ClientError => e
    Rollbar.warning e
    @registration.errors.add(
      :github_username,
      "We tried to create a repo but Github isn't responding. Try again in " \
      "a few moments.",
    )
    false
  end

  # Create a repo named s-<username>
  def repo_name
    "s-#{@registration.github_username}"
  end

  def execute
    puts "[DEBUG] Creating repo #{repo_name}..."
    create_repo repo_name
    puts "[DEBUG] Adding user to #{repo_name}..."
    add_user_to_repo repo_name
    puts "[DEBUG] Successfully created repo #{repo_name}!"
    true
  rescue => e
    Rollbar.error e
    @registration.errors.add(
      :github_username,
      "Something wrong happened when creating your repo. We've been alerted " \
      "and are looking into it. Try filling out the form once more or post " \
      "on Piazza.",
    )
    # If an error happened, undo all changes by deleting the repo. This will
    # never raise an Exception so it's a safe operation.
    delete_repo repo_name
    false
  end

  private

  def create_repo(repo_name)
    @gh_client.create_repo(
      repo_name,
      organization: ORGANIZATION,
      private: true,
    )
  end

  def delete_repo(repo_name)
    @gh_client.delete_repo "#{ORGANIZATION}/#{repo_name}"
  end

  def add_user_to_repo(repo_name)
    @gh_client.add_collaborator("#{ORGANIZATION}/#{repo_name}",
                                @registration.github_username)
  end
end
