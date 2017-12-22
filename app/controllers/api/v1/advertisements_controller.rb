module Api
	module V1
		class AdvertisementsController < ApplicationController
			skip_before_action :authenticate_request, only: [:index, :show]
			
			def index
				advertisements = if params[:category_id]
					Advertisement.includes(:categories).where('categories.id' => params[:category_id])
				else
					Advertisement.order('created_at DESC')
				end
				data = []
				advertisements.each do |advertisement|
					data << advertisement.as_json.merge(picture_data: advertisement.adphotos.first&.picture_url)
				end
				render json:{status:'sucess', message:'advertisement lists', data:data}, status: :ok
			end

			def show
				advertisement = Advertisement.find(params[:id])
				data = advertisement.as_json.merge(picture_data: advertisement.adphotos.first.picture_url)
				render json:{status:'ok', message:'You searched for...', data:data},status: :ok
			end

			def create
				advertisement = current_user.advertisements.new(advertisement_params)
				if advertisement.save
					advertisement.categories = Category.where(id: advertisement_params['category_id'])
					advertisement.adphotos.create!(:picture => params['file']) if params['file'].present?
					render json:{status: 'sucess', message: 'advertisement added', data:advertisement}, status: :ok
				else
					render json:{status: 'error', message: 'advertisement not added', data:advertisement}, status: :unprocessable_entity
				end
			end

			def destroy
				advertisement = Advertisement.find(params[:id])
				advertisement.destroy
				render json:{sucess:'deleted', message:'Advertisement has been deleted', data:advertisement}, sucess: :unprocessable_entity
			end

			private

			def advertisement_params
				params.permit(:name, :price, :description, :picture_data, :category_id => [])
			end
		end
	end
end