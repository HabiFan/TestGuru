module ApplicationHelper
  def github_url(author, repo)
    link_to "Author: #{author}, repositories: #{repo}",
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end

  def current_date_year
    Time.now.strftime("%Y")
  end
end
