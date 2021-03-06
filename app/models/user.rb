class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(username:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  # def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     user = User.create(name:     auth.info.nickname,
  #                        provider: auth.provider,
  #                        uid:      auth.uid,
  #                        email:    User.create_unique_email,
  #                        password: Devise.friendly_token[0,20]
  #                       )
  #   end
  #   user
  # end


  def self.create_unique_string
    SecureRandom.uuid
  end


  # def self.create_unique_email
  #   User.create_unique_string + "@example.com"
  # end

  if Rails.env.production?
    S3_CREDENTIALS={access_key_id: "", secret_access_key: "", bucket:"", s3_host_name: ""}
  end

  if Rails.env.production?
  has_attached_file :avatar, storage: :s3, s3_credentials: S3_CREDENTIALS,
  styles: { medium: "300x300!", thumb: "100x100!>"}, path:":attachment/:id/:style.:extension"
  else
    has_attached_file :avatar, styles: { medium: "300x300!", thumb: "100x100!>"}
  end

  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png","image/gif"],message: 'ファイル形式が不正です。ipg,jpeg,png,gifのいずれかのファイルで再度お試しください。'


  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end

  def full_profile?
    avatar? && family_name? && first_name? && family_name_kana? && first_name_kana?
  end

  #association
  has_many :favorites
  has_many :clips
  has_many :artists, through: :favorites
  has_many :events, through: :clips
  has_many :groups
  has_many :tweets
  has_many :comments

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

end
