class UsersController < ApplicationController

  def index
    @users = User.where.not(:id => current_user.id).paginate(page: params[:page], per_page: 15)
  end

end
