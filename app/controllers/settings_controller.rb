class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @settings = Settings::SettingsIndexService.new(current_user)
  end
end
