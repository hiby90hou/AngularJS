class Dishes < ActiveRecord::Base
	validates :name,
	presence: true,
	length: {in: 6..10}

	validates :image_url,
	length: {in: 10..100}
end