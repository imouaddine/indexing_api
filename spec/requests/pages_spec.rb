require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /pages" do
    let!(:page) { FactoryGirl.create(:page, :with_content) }

    it "list the urls and content" do
      get pages_path

      expect(json.first[:url]).to eq(page.url)
      expect(json.first[:content][:h1]).to eq(page.content["h1"])
      expect(json.first[:content][:h2]).to eq(page.content["h2"])
      expect(json.first[:content][:h3]).to eq(page.content["h3"])
      expect(json.first[:content][:urls]).to eq(page.content["urls"])

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /pages" do
    it "list the urls and content" do
      expect {
        post pages_path, url: "http://www.example.com"
      }.to change(Page, :count).by(1)

      page = Page.last
      expect(page.url).to  eq "http://www.example.com"
      expect(page.content["h1"]).to eq ["Example Domain"]
      expect(page.content["h2"]).to eq []
      expect(page.content["h3"]).to eq []
      expect(page.content["urls"]).to eq ["http://www.iana.org/domains/example"]
      expect(response).to be_success
    end

  end
end
