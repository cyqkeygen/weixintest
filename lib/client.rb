#encoding: utf-8
require "base64"

file = File.open(Rails.root.join('log/client.log'), 'a')
file.sync = true
$plogger = ActiveSupport::BufferedLogger.new(file)
$plogger.level = ActiveSupport::BufferedLogger::INFO

module Client

	def self.get_access_token(client_credential, appid, secret)
		url = Weixindemo::Application.config.weixin_host + "/cgi-bin/token?grant_type=#{client_credential}&appid=#{appid}&secret=#{secret}"
		r = RestCleint.get(url)	
		json = ActiveSupport::JSON.decode(r)
	end

	# def self.
		
	# end
end