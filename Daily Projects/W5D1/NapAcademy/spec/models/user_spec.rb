require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      username: 'purrnie',
      password: 'good_password'
    )
  end


  it { should validate_presence_of(:username) }
  #it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:password).is_at_least(6)}

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token" do
    it "sets a new session token on the user" do
      user.valid?
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end

    it "returns the new session_token" do

    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("purrnie", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("purrnie", "bad_password")).to eq(nil)
    end
  end
end
