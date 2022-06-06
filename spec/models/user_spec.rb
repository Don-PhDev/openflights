require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:reviews) }
  end

  subject {
    described_class.new(
      email: "example@gmail.com",
      password: "password"
    )
  }

  describe "validations" do
    it { should validate_uniqueness_of(:email) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
