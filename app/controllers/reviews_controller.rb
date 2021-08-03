class ReviewsController < ApplicationController

    before_action :set_review, only: [:show, :destroy, :edit, :update]
    before_action :redirect_if_not_logged_in
    before_action :user_allowed, only: [:edit, :destroy]

    def new
        if @book = Book.find_by_id(params[:book_id])
            @review = @book.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        book = Book.find(params[:review][:book_id])

        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        # @review = Review.find_by_id(params[:id])
    end

    def edit
        # if params[:book_id]
        #     book = Book.find_by_id(params[:book_id])
        #     if book.nil?
        #         redirect_to book_path, alert: "Not found"
        #     else
        #         @review = book.posts.find_by(id: params[:id])
        #         redirect_to book_review_path(book), alert: "not found" if @review.nil?
        #     end
        # else
            # @review = Review.find(params[:id])
        # end

    end

    def update
        # @review = Review.find_by_id(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy 
        redirect_to books_path
      end 

    private

    def review_params
        params.require(:review).permit(:book_id, :rating, :title, :content, :user_id)
    end

    def set_review
        @review = Review.find_by_id(params[:id])
    end

    def user_allowed
        if current_user != @review.user
            redirect_to books_path
        end
    end
        
end
