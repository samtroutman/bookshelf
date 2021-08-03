module ReviewsHelper
    def book_id_field(review)
        if review.book.nil?
            select_tag "review[book_id]", options_from_collection_for_select(Book.alpha, :id, :title)
        else
            hidden_field_tag "review[book_id]", review.book_id
        end
    end
end
