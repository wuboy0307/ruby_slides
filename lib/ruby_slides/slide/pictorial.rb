require 'zip/filesystem'
require 'fileutils'
require 'fastimage'
require 'erb'

module RubySlides
  module Slide
    class Pictorial
      include RubySlides::Util

      attr_reader :image_name_list, :title, :coords_list, :image_path_list, :image_per_page

      def initialize(options={})
        require_arguments [:presentation, :title, :image_path_list], options
        options.each {|k, v| instance_variable_set("@#{k}", v)}
        @coords_list = default_coords(image_path_list) unless @coords_list.any?
        @image_name_list = image_path_list.map{|image_path| File.basename(image_path) }
      end

      def save(extract_path, index)
        copy_media(extract_path, @image_path_list)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      def file_type
        image_name = @image_path_list[0] if @image_path_list.count > 0
        File.extname(image_name).gsub('.', '')
      end

      def default_coords(img_list)
        coords_list = []
        gap = 2
        slide_height = pixel_to_pt(405)
        slide_width =  pixel_to_pt(720)
        image_block_height = pixel_to_pt(200)
        image_block_width = pixel_to_pt(400)
        img_list.each_with_index do |img, index|
          x_start = ((slide_width / 2) - (image_block_width / 2)).round
          if image_per_page == 2
            y_start = ( index == 0 ? pixel_to_pt(gap) : 0 + (image_block_height * index) + pixel_to_pt(gap * index) ).round
          else
            y_start = ((slide_height / 2 - image_block_height / 2) + (image_block_height * index) + pixel_to_pt(20 * index) ).round
          end
          coords_list.push({x: x_start, y: y_start, cx: image_block_width, cy: image_block_height})
        end
        coords_list
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
