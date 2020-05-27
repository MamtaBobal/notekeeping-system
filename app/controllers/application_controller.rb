class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:notice] = "You are not authorized to perform this action"
    respond_to do |format|
      format.html do
        redirect_to request.headers["Referer"] || root_path
      end
    end
  end

end
