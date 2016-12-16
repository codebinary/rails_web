class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true, uniqueness: true #uniqueness no permite repetición 
	validates :body, presence: true, length: {minimum:20}
end
