require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe '#Authentication' do
    it 'hashes the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with("password", { :cost => 4})
      User.create(name: "user", email: "user@mail.com", password: 'password')
    end

    it 'returns a user if correct details are given' do
      user = User.create(name: "user", email: "user@mail.com", password: 'password')
      authenticated_user = user.authenticate("password")
      expect(user.email).to eq(authenticated_user.email)
    end
    
  end

  describe 'Validations' do
    it 'prevents saving with missing name' do
      expect { User.create(email: "user@mail.com", password: 'password') }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it 'prevents saving with missing email' do
      User.create(name: "user", password: 'password')
      user = User.all.first
      expect(user).to be_nil
    end

    it 'prevents saving with invalid email' do
      User.create(name: "user", email: "fail", password: '')
      user = User.all.first
      expect(user).to be_nil
    end

    it 'prevents saving with invalid password' do
      User.create(name: "user", email: "user@mail.com", password: 'pa')
      user = User.all.first
      expect(user).to be_nil
    end

  end

end
