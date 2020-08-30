class Recipe < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_many :ingredients
	has_many :directions
	has_many :taggings
	has_many :tags, through: :taggings
	accepts_nested_attributes_for :ingredients,
																reject_if: proc { |attributes| attributes['name'].blank? },
																allow_destroy: true
	accepts_nested_attributes_for :directions,
																reject_if: proc { |attributes| attributes['step'].blank? },
																allow_destroy: true

	validates :title, :description, presence: true

	def tag_list
		tags.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end
end
