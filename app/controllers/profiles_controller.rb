class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_admin, only: [:index]

  def myprofile
    @profile = Profile.find_by_user_id(current_user.id)

    if @profile.nil?
      redirect_to '/profiles/new'
    else
      render action: 'show'
    end
  end
  
	# GET /myprofile/pastorders
	# GET myprofile/pastorders.json
	def pastorders
		@profile = current_user.profile # Profile.find_by_user_id(current_user.id)
		@pastorders = current_user.orders # Order.find_all_by_user_id(current_user.id)
	
		respond_to do |format|
			format.html 
			format.json { head :no_content }
  		end
	end


  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.order( :firstname)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @user = User.find(current_user.id)
    @profile = Profile.new
    @profile.user_id = @user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
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
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :email, :address, :mobile, :user_id)
    end
end
