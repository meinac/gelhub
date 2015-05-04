class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @settings = current_user.settings
  end

  def destroy
    setting = current_user.settings.find(params[:id])
    setting.destroy
    redirect_to :back
  end

  def new
  end

  def fetch_repo
    res = github_client.repo(params[:repo])
    repository = Repository.where(full_name: res[:full_name]).first_or_initialize do |repo|
      repo.owner_id = res[:owner][:id]
      repo.name = res[:name]
    end
    repository.labels = github_client.labels(params[:repo]).map do |label|
      {name: label.name, color: label.color}
    end
    repository.save
    render json: repository
  end

  def create
    setting = Setting.new(setting_attributes)
    setting.user = current_user
    if setting.save
      redirect_to settings_path
    else
      redirect_to :back
    end
  end

  private
    def setting_attributes
      params.require(:setting).permit(:repository_id, :for, keywords: [], labels: [])
    end

end
