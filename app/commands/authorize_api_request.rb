class AuthorizeApiRequest
	prepend SimpleCommand

	def initialize(headers = {})
		@headers = headers
	end

	def call
		user
	end

	private

	attr_accessor :headers

	def user
		@user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
		@user || erros.add(:token, 'Invalid token') && nil
	end

	def decoded_auth_token
		@decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
	end

	def http_auth_header
		if headers['Authentication'].present?
			return headers['Authentication'].split('').last
		else
			errors.add(:token, 'Missing token')
		end
		nil
	end

end