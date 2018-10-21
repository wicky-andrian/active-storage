class Gallery < ApplicationRecord
	has_many_attached :images
	has_one_attached :sampul
end
