require 'fileutils'
require 'erb'

module RubySlides
  module Slide
    class Poster
      include RubySlides::Util

      attr_reader :title, :authors,
                  :introduction_title, :introduction_body,
                  :discussion_title, :discussion_body,
                  :values_title, :values_body,
                  :bibliography_title, :bibliography_body

      def initialize(options={})
        require_arguments [:title, :authors,
                           :introduction_title, :introduction_body,
                           :discussion_title, :discussion_body,
                           :values_title, :values_body,
                           :bibliography_title, :bibliography_body],
                           options
        options.each {|k, v| instance_variable_set("@#{k}", v)}
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        render_view('poster_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", index: 2)
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        render_view('poster_slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml")
      end
      private :save_slide_xml
    end
  end
end
