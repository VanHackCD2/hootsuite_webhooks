class Resource < ActiveResource::Base
	self.site = ENV["HOOTSUITE_WEBHOOKS_SERVER_API"]
end