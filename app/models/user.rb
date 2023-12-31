class User <ApplicationRecord
    has_many :articles, dependent: :destroy
    before_save { self.email=email.downcase}
    validates :username, presence:true,
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum: 2, maximum: 25}
    EMAIL_REGEX =   /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 100 },
                      format: { with: EMAIL_REGEX }
    has_secure_password
end