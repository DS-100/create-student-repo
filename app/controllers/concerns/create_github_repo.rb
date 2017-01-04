class CreateGithubRepo
  ORGANIZATION = 'DS-100'

  def initialize(username)
    @username = username
    @gh_client = Octokit::Client.new(
      access_token: ENV['github_token'],
    )
  end


  def user_exists?
    begin
      @gh_client.user @username
    rescue Octokit::NotFound => e
      false
    end
  end

  def execute(id)
    # Creates a repo name like s0042
    repo_name = "s#{id.to_s.rjust(4, '0')}"

    binding.pry

    create_repo repo_name
    team = create_team repo_name

    add_user_to_org(@username)
    add_user_to_team(@username, team)
  end

  def create_repo(repo_name)
    @gh_client.create_repo(repo_name, {
      organization: ORGANIZATION,
      private: true,
    })
  end

  def create_team(repo_name)
    @gh_client.create_team(ORGANIZATION, {
      name: repo_name,
      repo_names: ["#{ORGANIZATION}/#{repo_name}"],
      permission: "push",
    })
  end

  def add_user_to_org(username)
    @gh_client.update_organization_membership(ORGANIZATION, {
      user: username,
      role: 'member'
    })
  end

  def add_user_to_team(username, team)
    @gh_client.add_team_membership(team.id, username)
  end
end
