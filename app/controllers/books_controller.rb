class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @book = Book.new
        @book.build_genre 
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = session[:user_id]
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def index
        @books = Book.order_by_rating
    end

    def show 
        @book = Book.find(params[:id])
    end

    def highest_ranked
        @books = Book.highest_ranked
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :user_id, :genre_id, genre_attributes: [:name])
    end

end
