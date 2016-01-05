class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
    	auth=request.env["omniauth.auth"]
    	email=auth["info"]["email"]
      uid=auth.uid
      name=auth["extra"]["raw_info"]['name']
    	
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.where(:email=>email).first
      # render :plain => @user.inspect
      if @user
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
      	user = User.create(name:name,
                           provider:auth.provider,
                           uid:uid,
                           email:email,
                           password:Devise.friendly_token[0,20]
                           )

        sign_in_and_redirect user
      end
    end

    def google_oauth2
        auth=request.env["omniauth.auth"]
    render :plain => auth.inspect
        # uid=auth.uid
        # name=auth["info"]['name']
        # access_token=auth["credentials"]["token"]
        # refresh_token=auth["credentials"]["refresh_token"]
        # expire=auth["credentials"]["expires_at"]
        # profile_pic=auth['info'].image

      # if @user
      #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #   set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      # else
      #   user = User.create(name:name,
      #                      provider:auth.provider,
      #                      uid:uid,
      #                      email:email,
      #                      password:Devise.friendly_token[0,20]
      #                      )

      #   sign_in_and_redirect user
      # end  
    end
    
    def twitter
        auth=request.env["omniauth.auth"]
    render :plain => auth.to_json
      #   uid=auth.uid
      #   name=auth["extra"]["raw_info"]['name']
      #   email=auth["info"]["email"]
      #   access_token=auth["credentials"]["token"]
      #   secret=auth["credentials"]["secret"]
      #   profile_pic=auth['info'].image

      # if @user
      #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #   set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      # else
      #   user = User.create(name:name,
      #                      provider:auth.provider,
      #                      uid:uid,
      #                      email:email,
      #                      password:Devise.friendly_token[0,20]
      #                      )

      #   sign_in_and_redirect user
      # end  
    end

    def instagram
    	render :plain => request.env["omniauth.auth"].to_json

        # @user = User.from_omniauth(request.env["omniauth.auth"])
        # sign_in_and_redirect @user
    end
end