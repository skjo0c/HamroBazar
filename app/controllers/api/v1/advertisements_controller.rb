module Api
	module V1
		class AdvertisementsController < ApplicationController
			skip_before_filter :authenticate_request, only: [:index, :show]
			
			def index
				advertisements = Advertisement.order('created_at DESC')
				render json:{status:'sucess', message:'advertisement lists', data:advertisements}, status: :ok

			end

			def show
				advertisement = Advertisement.find(params[:id])
				render json:{status:'ok', message:'You searched for...', data:advertisement},status: :ok
			end

			def create
				advertisement = Advertisement.new(advertisement_params)
	
				if advertisement.save
					params[:advertisement][:picture_data].each do |file|
						advertisement.adphotos.create!(:picture => file)
					end	if params[:advertisement][:picture_data].present?
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
				params.permit(:name, :price, :description, :picture_data => [])
			end
		end
	end
end