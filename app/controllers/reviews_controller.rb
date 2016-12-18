class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.comida
	end

	def destroy
		@review = Review.find(params[:id])
		comida = @review.comida
		@review.destroy

		redirect_to comida
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :comida_id)
		end
end