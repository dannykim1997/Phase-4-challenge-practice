class Blogger < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :destinations, through: :posts
    validates :name, presence: true, uniqueness: true
    validates :age, presence: true, numericality: {greater_than: 0}
    validates :bio, presence: true, length: {minimum: 30}

    def total_likes
        posts.sum{|post|post.likes}
    end
    
    def most_liked
        posts.max_by{|post|post.likes}
    end

end
