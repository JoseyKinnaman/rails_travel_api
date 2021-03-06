module Api 
  module V1
    class ReviewsController < ApplicationController
    before_action :authenticate_user!, :only => [:destroy, :create, :update]
    
      def index
        @reviews = Review.page(params[:page]).per(10)
        json_response(@reviews)
      end
    
      def show
        @review = Review.find(params[:id])
        json_response(@review)
      end
    
      def create
        @review = Review.create!(review_params)
        json_response(@review, :created)
      end
    
      def update
        @review = Review.find(params[:id])
        if @review.update!(review_params)
          render status: 200, json: {
            message: "This quote has been successfully updated."
          }
        end
      end
    
      def destroy
        @review = Review.find(params[:id])
        if @review.destroy
          render status: 200, json: {
            message: "This quote has been successfully deleted."
          }
        end
      end
    
      private 
    
      def review_params
        params.permit(:author, :content, :place)
      end
    
    end
  end
end
