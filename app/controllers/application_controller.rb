class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def github_client
    @github_client ||= Octokit::Client.new(:access_token => current_user.access_token)
  end
end
