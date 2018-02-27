require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
  end

  describe "roles" do
    it "can be created as admin" do
      admin = User.create!(username: "username", password: "Pass", role: 1)

      expect(admin.role).to eq("admin")
      expect(admin.admin?).to be_truthy
    end

    it "can be created as regular user" do
      user = User.create!(username: "username", password: "Pass", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "can be defaulted as regular user" do
      defaulted = User.create!(username: "username", password: "Pass")

      expect(defaulted.role).to eq("default")
      expect(defaulted.default?).to be_truthy
    end
  end
  describe "relationships" do
    it {should have_many :awards}
  end
end
