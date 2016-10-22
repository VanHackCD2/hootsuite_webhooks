class Hook < ApplicationRecord
	validates :url, presence: true, length: { minimum: 5 }, uniqueness: true
end
