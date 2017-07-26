# RubySlides

Create Powerpoint presentations in Ruby with elements like slides, text, images, tables and charts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_slides'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_slides

Optionally use the latest code using:

```ruby
gem 'ruby_slides', git: "https://github.com/danielsousaio/ruby_slides.git"
```

## Getting started


Get started by creating a new object

```ruby
@presentation =  RubySlides::Presentation.new
```

RubySlides offer various types of slide as described below. If you would like
to see an example of a powerpoint generated with RubySlides take a look at the
powerpoint in the example folder. That's the result of running the spec.


### Introduction Slide

```ruby
title = "Hello Universe!"
subtitle = "Powerpoints with ruby"
@presentation.introduction_slide title, subtitle
```

### Textual Slide

```ruby
textual_title = "Textual Slide"
textual_items = ["Item 1", "Item 2", "Item 3"]
@presentation.textual_slide textual_title, textual_items
```

### Pictorial Slide

```ruby
pictorial_title = "Image Slide"
picture_path = "example/ruby.png"
@presentation.pictorial_slide pictorial_title, picture_path
```

### Pictorial with coordinates

```ruby
picture_coords = { x: 550 * 12700, y: 30 * 12700,     # Picture Position
                  cx: 80 * 12700, cy: 60 * 12700 }    # Picture Sizing
@presentation.pictorial_slide pictorial_title, picture_path, picture_coords
```

### Text Picture Slide

```ruby
text_picture_title = "Text Picture Slide"
text_picture_content = [
    "Picture size: 2MB", 
    "Picture author: Unknown Rubyist"
  ]
@presentation.text_picture_slide text_picture_title, picture_path,
                                 text_picture_content
```

### Picture Description Slide

```ruby
picture_description_title = "Picture Description Slide"
picture_description_content = [
    "Picture description, long text",
    "Additional information"
  ]
@presentation.picture_description_slide picture_description_title,
                                    picture_path,
                                    picture_description_content
```

### Table Slide

```ruby
table_title = "Table Slide"
table_series = [
  ["HeaderA", "HeaderB"],
  ["ValueA", "ValueB"]
]
@presentation.table_slide table_title, table_series
```

### Chart Slide

```ruby
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
@presentation.chart_slide chart_title, chart_series
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielsousaio/ruby_slides. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubySlides project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_slides/blob/master/CODE_OF_CONDUCT.md).
