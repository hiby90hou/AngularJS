class Project < ApplicationRecord
	mount_uploader :preview, PreviewUploader
end
