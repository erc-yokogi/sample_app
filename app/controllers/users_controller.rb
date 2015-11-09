class UsersController < ApplicationController

#2015/11/06 add 11/09 change
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
#2015/11/06 add END

#2015/11/09 add
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end
#2015/11/09 add END

  def show
   @user = User.find(params[:id])
  end


  def new
   @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    #2015/11/06 del
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

#2015/11/09 add
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
#2015/11/09 add END

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

#2015/11/06 add
    # Before actions

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
#2015/11/06 add END

#2015/11/09 add
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
#2015/11/09 add END

end
