class UsersController < ApplicationController
  def index
    @users = User.all
    Rails.application.load_seed
  end
end
