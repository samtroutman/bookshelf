class ReviewsController < ApplicationController

    before_action :set_review, only: [:show, :destroy]


    def new
        if @book = Book.find_by_id(params[:book_id])
            @review = @book.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def index
        if @book = Book.find_by_id(params[:book_id])
            @reviews = @book.reviews
        else
            @reviews = Review.all
        end
    end

    def destroy
        @review.destroy
        redirect_to review_path
    end

    private

    def review_params
        params.require(:review).permit(:book_id, :rating, :title, :content)
    end

    def set_review
        @review = Review.find_by(params[:id])
    end
        
end
