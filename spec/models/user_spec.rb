require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user is valid' do
       @user = User.create(first_name: "string", last_name: "string", email: "string", password: "string", password_confirmation: "string")
      expect(@user).to be_valid
   
    end
    it 'presence of user first_name is false' do
           @user = User.create(last_name: "string", email: "string", password: "string", password_confirmation: "string")
          expect(@user.errors.full_messages).to include("First name can't be blank")
    end
      it 'presence of user last_name is false' do
               @user = User.create(first_name: "string", email: "string", password: "string", password_confirmation: "string")
              expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
        it 'presence of user email is false' do
                   @user = User.create(first_name: "string", last_name: "string", password: "string", password_confirmation: "string")
                  expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'presence of user password_digest is false' do
                   @user = User.create(first_name: "string", last_name: "string", email: "string", password: "", password_confirmation: "string")
                  expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'presence of user password_digest is false' do
          @user = User.create(first_name: "string", last_name: "string", email: "string", password: "string")
         expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        end
  end

  describe '.authenticate_with_credentials' do
    it "user email is not case sensitive" do
      @user = User.create(first_name: "string", last_name: "string", email: "string", password: "string", password_confirmation: "string")
      @user1 = @user.authenticate_with_credentials("sTring", "string")

      expect(@user1).to eq(@user)
    end
    it "user email is stripped" do
      @user = User.create(first_name: "string", last_name: "string", email: "string", password: "string", password_confirmation: "string")
      @user1 = @user.authenticate_with_credentials("string ", "string")

      expect(@user1).to eq(@user)
    end
    
  end
end

