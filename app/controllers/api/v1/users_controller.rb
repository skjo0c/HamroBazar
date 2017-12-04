module Api
	module V1
		class UsersController < ApplicationController

			skip_before_action :authenticate_request, only: %i[login register]

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

			def login
				authenticate params[:email], params[:password]
			end

			private
			def user_params
				params.permit(:firstname, :lastname, :email, :password, :mobile, :picture)
			end

			def authenticate(email, password)
				command = AuthenticateUser.call(email, password)

				if command.success?
				  render json: {
				    access_token: command.result,
				    message: 'Login Successful'
				  }
				else
				  render json: { error: command.errors }, status: :unauthorized
				end
			end
		end
	end
end