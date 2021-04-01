class Post < ActiveRecord::Base
    validate :clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def clickbait 
        if title && !title.match(/(Won't Believe)|(Secret)|(Top \d+)|(Guess)/)
            errors.add(:title, "error")
        end
    end
end
