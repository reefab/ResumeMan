## Used for parsing markdown docs in the resume.yml
require 'maruku'
## Pdfmaker custom extension
require 'makepdf'
## For generating gravatar hash
require 'digest/md5'

activate :livereload

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "index.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
    def display_date(date)
        if date.is_a?(Date)
            # Change this if you prefer another date format:
            # http://www.ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html#method-i-strftime
            date.strftime("%Y-%m")
            # Comment above and uncomment this if you want days displayed
            # date.strftime("%Y-%m-%d")
        else
            date
        end
    end

    def display_age(birthday)
        now = Date.today
        now.year - birthday.year - (Date.new(now.year, birthday.month, birthday.day) > now ? 1 : 0)
    end

    def gravatar_url(email)
      hash = Digest::MD5.hexdigest email.downcase
      "https://www.gravatar.com/avatar/#{hash}?s=130&d=mm"
    end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Disable this if you don't want PDF generation
  activate :pdfmaker
end

activate :deploy do |deploy|
  deploy.method = :git
end
