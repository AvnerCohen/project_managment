class Subdomain

	def self.matchs?(request)
		request.subdomain.present? && request.subdomain != "www"
	end


end