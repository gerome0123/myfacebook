class ProfilesController < ApplicationController
  
  before_action :set_profile, only: [:show, :edit, :update, :destroy,]
  before_action :set_user, only: [:adduser]
  load_and_authorize_resource :only => [:edit]


  def adduser

    current_user.friend_request(set_user)
    flash[:notice] = "You Added #{@user.profile.firstname}"
    redirect_to @user.profile
  end

  # GET /profiles
  # GET /profiles.json
  def index
   
    @profile = params[:search]
    authorize! :read, @profile
    if Profile.where(lastname: @profile).present?
       @profile = Profile.lastname(params[:search])
    else
    @profile = Profile.search_by_full_name(params[:search])

    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    
  end

  # GET /profiles/new
  def new
 
  end

  # GET /profiles/1/edit
  def edit
 
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
      if @profile.update(profile_params)
        redirect_to @profile
      else
        redirect_to @profile
      end
    end


  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :firstname, :lastname, :birthday, :about, :gender, :avatar)

    end
   
end