class BooksController < ApplicationController

    def new
        @book = Book.new
        @book.build_genre 
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :genre_id, :genre_attributes[:name])
    end
end
