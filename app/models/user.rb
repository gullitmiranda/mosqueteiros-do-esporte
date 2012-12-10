class User < ActiveRecord::Base
  # :lockable, :timeoutable and :confirmable
  devise :database_authenticatable,
         :registerable,
         :token_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable
  
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :name,
                  :remote_avatar_url,
                  :avatar

  validates :name, presence: true
  
  mount_uploader :avatar, UserAvatarUploader

  has_many :payments, dependent: :destroy
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    data = access_token.info

    if user = self.find_by_email(data.email)
      user
    else
      self.create!(email: data.email, 
                   password: Devise.friendly_token[0,20], 
                   name: data.name, 
                   remote_avatar_url: data['image'].gsub!('square', 'normal'))
    end
  end

  def payments_from_failed_projects
    payments.completed.joins(:project).where('projects.expires_at <= ?', Date.today).where('projects.success = false')
  end

  def credit
    payments_from_failed_projects.pluck(:amount).sum
  end

  def first_name
    name.split(" ").first    
  end
end
