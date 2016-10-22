class Hook < Resource
	validates :url, presence: true, length: { minimum: 5 }
	#validates_uri_existence_of :url, with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

	def self.empty_fields
		{ url: nil }
	end

	def self.set(hook, params)
	  hook.url = params[:url]
	end
end
