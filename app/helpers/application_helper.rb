module ApplicationHelper
  
  ALERTS = { alert: 'danger', notice: 'primary' }.freeze

  def github_url(author, repo)
    link_to "Author: #{author}, repositories: #{repo}",
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end

  def current_date_year
    Date.current.strftime("%Y")
  end

  def alert_manager(key)
    ALERTS[key.to_sym] || key
  end

end
