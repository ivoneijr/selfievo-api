class API::V1::UsersController < ApplicationController
  before_action :authenticate, except: [:create, :signin, :activate, :retrieve_password, :exists]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :activate]

  def index
    @users = User.all
    render json: @users
  end

  def show
    if @user
      render json: @user.as_json({include:[person:{include:[:address]}]})
    else
      head 404
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201, location: api_v1_user_url(@user)
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def update
    if @user.update(user_params)
      head 200
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  def me
    render json: @authenticated, status: 200
  end

  def signin
    @signin = SignIn.new(signin_params)

    if @signin.save
      render json: @signin, status: 200
    else
      render json: { errors: @signin.errors }, status: 422
    end
  end

  def activate
    head 200 if @user.active?
    @user.activate
    head 200
  end

  def retrieve_password
    @password_retrieval = PasswordRetrieval.new(password_retrieval_params)
    if @password_retrieval.retrieve
      head 200
    else
      head 404
    end
  end

  def exists
    return head 200 if User.find_by(username: params[:name])
    head 404
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
      head 404 unless @user
    end

    def password_retrieval_params
      params.require(:user).permit(:email)
    end

    def signin_params
      params[:user][:remote_ip] = request.remote_ip
      params.require(:user).permit(:username, :password, :remote_ip)
    end

# specialty_fields_attributes: [:id, :job_id, :avatar, :_destroy])

    def user_params
      p '@@@@@@@@@@@@@@@@@@@@@@@@@@@'
      p params
      p '@@@@@@@@@@@@@@@@@@@@@@@@@@@asdasd'

      params.require(:user).permit(:id,:username, :password, :email, :_destroy,
        person_attributes: [
          :id,
          :user_id,
          :name,
  	      :last_name,
  	      :birth_date,
  	      :registry,
  	      :sex,
  	      :phone,
  	      :type,
          :_destroy,
          address_attributes: [
            :id,
            :person_id,
            :street,
    	      :number,
    	      :neighborhood,
    	      :city,
    	      :state,
    	      :zip,
    	      :complement,
            :_destroy
          ]
        ])
    end

end
