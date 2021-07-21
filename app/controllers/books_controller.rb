class BooksController < ApplicationController

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
        @books = Book.all
    end

    def show 
        @book = Book.find(params[:id])
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :user_id, :genre_id, genre_attributes: [:name])
    end
end
