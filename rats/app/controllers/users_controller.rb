class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_role ==  :admin
      @users = User.all
    else
      redirect_back fallback_location: { action: "show", id: current_user.id}, :notice => 'Only admins allowed'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_by_email(user_params[:email])
    if !@user.nil?
      if !@user.password.is_password?(params[:user][:password])
          #flash.now.alert = "Password does not match password in system."
	  respond_to do |format|
          format.html { redirect_to signup_path, notice: "Password does not match password in system" }
	  end
      else
        role = params[:role]
        role = Role.find(role[:role_id])
	if @user.has_role? role.name
	  respond_to do |format|
          format.html { redirect_to login_path, notice: "Role #{role.name} already exists. Please Login" }
	  end
	else
	  if @user.add_role(role.name)
            session[:user_id] = @user.id
      	    session[:current_role] = role.name
            #flash.now.alert = "Role #{role.name} added"
	    respond_to do |format|
            format.html { redirect_to edit_user_path(@user.id), notice: "Role #{role.name} added" }
	    end
          else
            render "new"
          end
	end
      end
    else
      @user = User.new(user_params)
      role = params[:role]
      role = Role.find(role[:role_id])
      @user.add_role(role.name)
      if current_user
        if @user.save
	  respond_to do |format|
          format.html { redirect_to edit_user_path(@user.id), notice: "New user created!" }
          end
	else
          render "new"
        end
      else
        if @user.save
          session[:user_id] = @user.id
      	  session[:current_role] = role.name
	  respond_to do |format|
          format.html { redirect_to edit_user_path(@user.id), notice: "Thank you for signing up!" }
          end
	else
          render "new"
         end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    des = false
    if(current_role == (:recruiter || :admin) && user_params[:company_id] != @user.company_id)
      des = true
    end
    respond_to do |format|
      if @user.update(user_params)
        Job.destroy_recruiter_jobs @user if des
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    Application.destroy_user_applications @user
    Job.destroy_recruiter_jobs @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :city, :state, :country, :phone_number, :role, :company_id)
    end
end
