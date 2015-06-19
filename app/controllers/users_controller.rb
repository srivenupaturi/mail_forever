class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/login
  # GET /users/login.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(filter_sign_up_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user.profile, :notice => "Welcome #{@user.name}!" }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => {errors: @user.errors, type: 'register'}, :status => :unprocessable_entity }
      end
    end
  end

  # POST /users
  # POST /users.json
  def login
    login_params = filter_login_params
    @user = User.where('email = ?', login_params[:email]).first
    respond_to do |format|
      if (@user && @user.authenticate(login_params[:hashed_password]))
        format.html { redirect_to @user.profile, :notice => "Welcome #{@user.name}!" }
        format.json { render :json => @profile}
      else
       format.html { render :action => "new", notice: 'Invalid email or password.' }
       format.json { render :json => {errors: ['Invalid email or password.'], type: 'login'}, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def filter_sign_up_params
    processed_params = params.require(:user).permit(:name, :email, :user_name)
    processed_params['hashed_password'] = User.processed_password(params[:hashed_password])
    processed_params
  end

  def filter_login_params
    params.slice(:email, :hashed_password)
  end
end
