module Api
	module V1
		class CategorysController < ApplicationController
			
			before_filter: authorize_admin, only: :create

			def create
				category = Category.new(category_params)
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