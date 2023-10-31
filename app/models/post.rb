class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title_is_clickbait?

    CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

    def title_is_clickbait?
        byebug
        if title
            if CLICKBAIT.none? {|pat| title.include?(pat)}
                errors.add(:title, "Title must be more clickbait-y")
            end
        end
    end

end
