class UsersController < ApplicationController
  before_action :set_user, only: [:add_user, :reject_user, :acceptuser, :updateprofile]

  def show
    @users = User.all

  end

  def adduser

    current_user.friend_request(set_user)
    flash[:notice] = "You added #{set_user.profile.firstname}"
    redirect_to(:controller => 'posts',:action => 'index')
  end

  def unfriend_user
    current_user.remove_friend(set_user)
    flash[:notice] = "you Unfriend #{set_user.profile.firstname}"
    redirect_to(:controller => 'posts',:action => 'index')
  end

  def accept_user
    current_user.accept_request(set_user)
    flash[:notice] = "You are now friend"
    redirect_to(:controller => 'posts',:action => 'index')
  end

  def reject_user
    current_user.decline_request(set_user)
    flash[:notice] = "You Decline #{set_user.profile.firstname}"
    redirect_to(:controller => 'posts',:action => 'index')
  end

  def friend

  end

  def profile
    render 'myprofile'
  end

  def editprofile
    @user = User.find(params[:id])

  end

  def updateprofile
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :myprofile, status: :ok, location: @user }
      else
        format.html { render :myprofile }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  private

    def set_user
      @user = User.find(params[:id])
    end

end