require 'rails_helper'

RSpec.describe Parser, type: :service do

  let(:url) { "http://www.example.com" }
  let(:parser) { Parser.new(url) }
  let(:html_content) { file_fixture("example.html").read }

  before do
    allow(parser).to receive(:open).with(url).and_return(html_content)
  end

  describe "#parse" do

    it "gets the content from the url" do
      expect(parser).to receive(:open).with(url)
      parser.parse
    end

    it "returns H1s" do
      expect(parser.parse[:h1]).to eq(["Example Domain"])
    end

    it "returns H2s" do
      expect(parser.parse[:h2]).to eq(["H2 - 1", "H2 - 2"])
    end

    it "returns H3s" do
      expect(parser.parse[:h3]).to eq(["H3 - 1", "H3 - 2", "H3 - 3"])
    end

    it "returns links" do
      expect(parser.parse[:urls]).to eq(["http://www.iana.org/domains/example", "http://www.hello.com"])
    end
  end
end
