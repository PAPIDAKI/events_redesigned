class UsersController < ApplicationController

	def index
		@users=User.all
	end

	def show
		@user=User.find(params[:id])
	end

	def new
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			#to  logged in  after creating an acount
			session[:user_id]=@user.id
			redirect_to @user,notice:'Thanks for signing up!'
		else
			render :new
		end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user,notice:"Acount updated!"
		else
			render :edit
		end
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		#cut off the session
		session[:user_id]=nil
		redirect_to events_path,alert:"Account deleted!"

	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

	def set_user
		@user=User.find(params[:id])


	end



end
