require 'rails_helper'
describe Article do
  describe "#create" do

    it "is valid with all" do
      user = create(:user, id: "1")
      article = build(:article)
      article.valid?
      expect(article).to be_valid
    end

    it "is invalid without user acount" do
      article = build(:article)
      article.valid?
      expect(article.errors[:user]).to include("must exist")
    end

    it "is invalid without body" do
      user = create(:user, id: "1")
      article = build(:article, body: "")
      article.valid?
      expect(article.errors[:body]).to include("can't be blank")
    end

    it "is invalid without topic" do
      user = create(:user, id: "1")
      article = build(:article, topic: "")
      article.valid?
      expect(article.errors[:topic]).to include("can't be blank")
    end
  end
end