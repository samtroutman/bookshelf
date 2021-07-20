class ReviewsController < ApplicationController

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

    def index
    end

    private

    def review_params
        params.require(:review).permit(:book_id, :title, :content, :rating)
    end
end
