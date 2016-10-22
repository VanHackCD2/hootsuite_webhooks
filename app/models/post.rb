class Post < Resource
	belongs_to :hook

	validates :message, presence: true
	
	def self.empty_fields
		{ message: nil }
	end

	def self.set(post, params)
	  post.message = params[:message]
	end
end
