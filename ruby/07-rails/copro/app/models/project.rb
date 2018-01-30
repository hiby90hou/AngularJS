class Project < ApplicationRecord
	mount_uploader :preview, PreviewUploader
	has_many :comments
	has_many :likes
end
