class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :currency
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,:omniauth_providers=>[:facebook,:twitter,:instagram,:google_oauth2]
  
  validates :referral_code, :uniqueness => true
  before_create :create_referral_code
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # The result may contain 0-9 and a-f. Also resulting hexadecimal string is twice n.
  def create_referral_code
      referral_code = SecureRandom.hex(3)
      @collision = User.find_by_referral_code(referral_code)

      while !@collision.nil?
          referral_code = SecureRandom.hex(3)
          @collision = User.find_by_referral_code(referral_code)
      end

      self.referral_code = referral_code
  end

  # The result may include affiliate id of invited user
  # def create_affiliate_id
  #   if(cookies[:referral_code])
  #     referral_code = cookies[:referral_code]
  #     @aff_user = User.find_by_referral_code(referral_code)
  #     if !aff_user.nil?
  #       self.affiliate_id = @aff_user.id
  #     end

  #     cookies.delete(:referral_code, :domain => 'xskin.ca')
  #   end
  # end
end
