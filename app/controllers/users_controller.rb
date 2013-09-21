class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    access_token = params[:user][:access_token]
    begin
      user = FbGraph::User.fetch(access_token)
      params = user.raw_attributes
      User.create(:access_token => params["id"], :first_name => params["first_name"],  :last_name => params["last_name"], :link => params["link"], :username => params["username"], :gender => params["gender"], :locale => params["locale"]  )
      redirect_to users_path
    rescue => e
      flash[:now] = e.message
      @user = User.new
      render :new
    end
  end

  def show
    @user = User.find_by first_name: params[:username]
  end

end
