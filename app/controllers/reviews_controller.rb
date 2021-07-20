class ReviewsController < ApplicationController

    def new
        if @book = Book.find_by_id(params[:book_id])
            @review = @book.reviews.build
        else
            @review = Review.new
        end
    end

    def index
    end

    private

    def review_params
        params.require(:review).permit(:book_id, :title :content, :rating)
    end
end
