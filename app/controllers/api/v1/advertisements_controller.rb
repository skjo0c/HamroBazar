module Api
	module V1
		class AdvertisementsController < ApplicationController

			def create
				advertisement = Advertisement.new(advertisement_params)

				if advertisement.save
					render json:{status: 'sucess', message: 'advertisement added', data:advertisement}, status: :ok
				else
					render json:{status: 'error', message: 'advertisement not added', data:advertisement}, status: :unprocessable_entity
				end
			end

			private

			def advertisement_params
				params.permit(:name, :price, :description)
			end
		end
	end
end