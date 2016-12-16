class Article < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true #uniqueness no permite repetición 
	validates :body, presence: true, length: {minimum:20}
end
