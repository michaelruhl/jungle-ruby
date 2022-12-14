class User < ActiveRecord::Base

  
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, :uniqueness => {:case_sensitive => false}
    validates :password, presence: true, length: { minimum: 3 }
    validates :password_confirmation, presence: true, length: { minimum: 3 }

    def authenticate_with_credentials(email, password)
      user = User.where("lower(email)= ?", email.downcase.strip).first
      if self.authenticate(password)
        user
      else
        nil 
      end
    end

  end