source "https://rubygems.org"

gem "middleman", "~>3.0.11"
gem "middleman-deploy", "~> 0.0.11"

if (/darwin/ =~ RUBY_PLATFORM) != nil # For OS X with wkpdf
    gem "wkpdf", "~> 0.6.10"
else # Other platforms
    gem "pdfkit", "~>0.5.2"
    gem "wkhtmltopdf-binary", "~> 0.9.9.1"
end
