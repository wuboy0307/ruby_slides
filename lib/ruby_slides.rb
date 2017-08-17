require "ruby_slides/version"
require "ruby_slides/util"
require "ruby_slides/slide/introduction"
require "ruby_slides/slide/pictorial"
require "ruby_slides/slide/picture_description"
require "ruby_slides/slide/text_picture_split"
require "ruby_slides/slide/textual"
require "ruby_slides/slide/table"
require "ruby_slides/slide/chart"
require "ruby_slides/slide/poster"
require "ruby_slides/compression"
require "ruby_slides/presentation"

module RubySlides
  ROOT_PATH = File.expand_path("../..", __FILE__)
  TEMPLATE_PATH = "#{ROOT_PATH}/template/"
  VIEW_PATH = "#{ROOT_PATH}/lib/ruby_slides/views/"
end
