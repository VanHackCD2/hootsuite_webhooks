class Hook < Resource
	has_many :posts
	
	validates :url, presence: true, length: { minimum: 5 }
	#validates_format_of :url, with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/i

	def self.empty_fields
		{ url: nil }
	end

	def self.set(hook, params)
	  hook.url = params[:url]
	end
end
