class WelcomeController < ApplicationController

	before_action :authenticate_user!

	helper_method :pgb_connect_link, :pgb_apps

	CLIENT_ID = "abcdef"
	CLIENT_SECRET = "1234567890"

  def index
  end

  def pgb_callback
  	code = params[:code]
  	params = 
		x = Net::HTTP.post_form(URI.parse('https://build.phonegap.com/authorize/token'), 
			{
	  		'code' => code,
	  		'client_id' => CLIENT_ID,
	  		'client_secret' => CLIENT_SECRET
			})
		o = JSON[x.body]

		if o["access_token"]
			token = ExternalToken.new :token => o["access_token"], 
				:user => current_user, :provider => 'pgb'
			token.save
			redirect_to :root
		end

  end

  def pgb_disconnect
  	current_user.external_tokens.where(:provider => 'pgb').destroy_all
  	redirect_to :root
  end

  private

  def pgb_connect_link
  	"https://build.phonegap.com/authorize?client_id=" + CLIENT_ID
  end

  def pgb_apps
  	token = current_user.external_tokens.where(:provider => 'pgb').first.try(:token)
  	x = Net::HTTP.get(URI.parse("https://build.phonegap.com/api/v1/me?access_token=#{token}"))
  	o = JSON[x]
  	o["apps"]["all"]
  end
end
