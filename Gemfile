source "https://rubygems.org"

gem "middleman", "~>3.0.11"
gem "middleman-deploy", "~> 0.0.11"

if /darwin/ =~ RUBY_PLATFORM  # For OS X
    if /darwin13/ =~ RUBY_PLATFORM # For Mavericks that can't use wkpdf yet
        gem "pdfkit", "~>0.5.4"
        gem "wkhtmltopdf-binary", "~> 0.9.9.1"
    else
        gem "wkpdf", "~> 0.6.10"
    end
else # Other platforms
    gem "pdfkit", "~>0.5.2"
    gem "wkhtmltopdf-binary", "~> 0.9.9.1"
end
