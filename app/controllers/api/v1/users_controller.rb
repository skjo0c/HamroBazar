module Api
	module V1
		class UsersController < ApplicationController

			def index
				users = User.order('created_at DESC')
				render json:{status: 'ok', message: 'all users...', data:users}, status: :ok
			end

			def create
				user = User.new(user_params)
				if user.save
					render json:{status:'ok', message:'user added', data:user}, status: :ok
				else
					render json:{status:'error', message:'user not added', data:user}, status: :unprocessable_entity
				end
			end

			def show
				user = User.find(params[:id])
				if user.valid?
					render json:{status:'ok', message:'User details', data:user}, status: :ok
				else
					render json:{status:'error', message:'user not added', data:user}, status: :unprocessable_entity
				end
			end

			private
			def user_params
				params.permit(:firstname, :lastname, :email, :password, :mobile, :picture)
			end
		end
	end
end