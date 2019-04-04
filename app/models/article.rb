class Article < ApplicationRecord
	belongs_to :user

	validates :body, :topic, presence: true


end
