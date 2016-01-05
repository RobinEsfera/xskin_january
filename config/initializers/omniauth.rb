Rails.application.config.middleware.use OmniAuth::Builder do
	ENV['FACEBOOK_KEY']    ="809555852505939" # "140748252799489"
	ENV['FACEBOOK_SECRET'] ="3164163fa1fbc9f2cf61a8295ab33e32" #"070f9e2dc2679de3298e5d987c073c89"
	ENV['INSTAGRAM_ID']    ="ef88e07b23ee40b0aa2a0453248a98ab"
	ENV['INSTAGRAM_SECRET']="dfed6246c17a4c26ab1eae9956144e33"

  	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           scope: 'public_profile,email', info_fields: 'email,name,first_name,last_name'

	provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET'],:scope =>'basic'


	ENV['TWITTER_CLIENT_ID']="9SVID7Gfw7oU1YwoM72hexWoC"
	ENV['TWITTER_CLIENT_SECERT']="yZN2VwUmbkqZORRBf6EK49v7RWkBHzjSTlOf9L3ZwYCHRfH783"
	provider :twitter, ENV['TWITTER_CLIENT_ID'], ENV['TWITTER_CLIENT_SECERT'],
	{
		:secure_image_url => 'true',
		:image_size => 'original',
		:include_email => 'true',
		:authorize_params => {
		  :force_login => 'true',
		  :lang => 'en'
		}
	}

	ENV["GOOGLE_CLIENT_ID"]="864161169004-t0li5iq7m23okcfq9hniqg4edf2e2djb.apps.googleusercontent.com"
	ENV["GOOGLE_CLIENT_SECRET"]="xMNrZjmH_5FYv2mi6QLkx9xw"
	provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
		prompt: 'consent',
		access_type: 'offline',
		scope: ['email', 'profile', 
		'https://www.googleapis.com/auth/plus.me',
		'https://www.googleapis.com/auth/plus.stream.write',
		'https://www.googleapis.com/auth/gmail.readonly',   
		'https://www.googleapis.com/auth/admin.directory.group.readonly',
		'https://www.googleapis.com/auth/admin.directory.group.member.readonly',
		'https://www.googleapis.com/auth/admin.directory.user.readonly',
		'https://www.googleapis.com/auth/plus.media.upload']
	}
end