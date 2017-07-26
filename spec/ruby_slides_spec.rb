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

      # Introduction
      introduction_title = "Introduction Slide"
      introduction_subtitle = "Introduction Subtitle"


      # Textual
      textual_title = "Textual Slide"
      textual_items = ["Item 1", "Item 2", "Item 3"]

      # Pictorial
      pictorial_title = "Image Slide"
      picture_path = "example/ruby.png"

      # Pictorial with coordinates
      picture_coords = { x: 550 * 12700, y: 30 * 12700,   # Picture Position
                         cx: 80 * 12700, cy: 60 * 12700 } # Picture Sizing

      # Text Picture
      text_picture_title = "Text Picture Slide"
      text_picture_content = ["Picture size: 2MB",
                              "Picture author: Unknown Rubyist"]

      # Picture Description
      picture_description_title = "Picture Description Slide"
      picture_description_content = ["Picture description, long text",
                                     "Additional information"]


      # Table
      table_title = "Table Slide"
      table_series = [
          ["HeaderA", "HeaderB"],
          ["ValueA", "ValueB"]
        ]

      # Chart
      chart_title = "Chart Slide"
      chart_series = [
        {
          column: "Col1",
          rows:   ["A", "B", "C", "D"],
          values: ["1", "3", "5", "7"]
        },
        {
          column: "Col2",
          rows:   ["A", "B", "C", "D"],
          values: ["2", "4", "6", "8"]
        }
      ]

      @presentation.introduction_slide introduction_title, introduction_subtitle
      @presentation.textual_slide textual_title, textual_items
      @presentation.pictorial_slide pictorial_title, picture_path
      @presentation.pictorial_slide pictorial_title, picture_path, picture_coords
      @presentation.text_picture_slide text_picture_title, picture_path,
                                       text_picture_content
      @presentation.picture_description_slide picture_description_title,
                                              picture_path,
                                              picture_description_content
      @presentation.table_slide table_title, table_series
      @presentation.chart_slide chart_title, chart_series

      # Compress and generate pptx
      @presentation.save("example/example.pptx")
    end
  end
end
