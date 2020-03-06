require 'zip/filesystem'
require 'fileutils'
require 'fastimage'
require 'erb'

module RubySlides
  module Slide
    class Pictorial
      include RubySlides::Util

      attr_reader :image_name, :title, :coords, :image_path

      def initialize(options={})
        require_arguments [:presentation, :title, :image_path], options
        options.each {|k, v| instance_variable_set("@#{k}", v)}
        @coords = default_coords unless @coords.any?
        @image_name = File.basename(@image_path)
      end

      def save(extract_path, index)
        copy_media(extract_path, @image_path)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      def file_type
        File.extname(image_name).gsub('.', '')
      end

      def default_coords
        # Assume Slides width * height is like 620 * 360
        slide_width = 620
        slide_height = 360
        image_block_height = (slide_height * (4/5.to_f)).round
        # image_size is 1920*1280 (3:2)
        image_block_width = (image_block_height * (3 / 2.to_f)).round
        y_start = ((slide_height - image_block_height) / 2).round
        x_start = ((slide_width - image_block_width) / 2).round
        # image_size is 1920*1280 (3:2)
        x_end = slide_width - x_start
        y_end = slide_height - y_start

        {x: pixel_to_pt(x_start), y: pixel_to_pt(y_start), cx: pixel_to_pt(x_end), cy: pixel_to_pt(y_end)}
      end
      private :default_coords

      def save_rel_xml(extract_path, index)
        render_view('pictorial_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", index: 2)
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        render_view('pictorial_slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml")
      end
      private :save_slide_xml
    end
  end
end
