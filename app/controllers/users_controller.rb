class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])

    render("show")
  end

  def landing
    @user = User.find(params[:id])

    render('/')
  end

  # def edit
  #   @user = User.find(params[:id])
  #
  #   render("edit.html.erb")
  # end
end
