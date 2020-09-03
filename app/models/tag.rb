class Tag < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :taggings
	has_many :recipes, through: :taggings

	def to_s
		name
	end
end
