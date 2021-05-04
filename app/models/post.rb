class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, length: {minimum: 10}
end
