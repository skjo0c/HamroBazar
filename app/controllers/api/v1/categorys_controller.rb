module Api
	module V1
		class CategorysController < ApplicationController
			
			before_filter :authorize_admin, only: [:create, :destroy]
			skip_before_action :authenticate_request, only: [:index, :show]

			def index
				categorys = Category.order('title ASC')
				render json:{data:categorys}
			end

			def create
				category = Category.new(category_params)
				if category.save
					render json:{status: 'sucess', message: 'category added', data:category}, status: :ok
				else
					render json:{status: 'error', message: 'category not added', data:category}, status: :unprocessable_entity
				end
			end

			def destroy
				category = Category.find(params[:id])
				category.destroy
				render json:{sucess:'deleted', message:'Category has been deleted', data:category}, sucess: :unprocessable_entity
			end

			private

			def authorize_admin
				return unless !current_user.admin?
				render json: { error: command.errors }, status: :unauthorized
			end

			def category_params
				params.permit(:title)
			end
		end
	end
end