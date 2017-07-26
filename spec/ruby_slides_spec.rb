require "spec_helper"
# require "ruby_slides"

RSpec.describe RubySlides do
  it "has a version number" do
    expect(RubySlides::VERSION).not_to be nil
  end

  context "generating a powerpoint" do

    before do
      @presentation = RubySlides::Presentation.new
    end

    it "is a valid powerpoint file" do
      @presentation.introduction_slide "Title", "Subtitle"
      @presentation.save("example/example.pptx")
    end
  end
end
