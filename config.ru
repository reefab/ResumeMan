require 'rubygems'
require 'bundler'
Bundler.setup
require 'middleman'
require 'middleman-core/preview_server'

module Middleman::PreviewServer
  def self.preview_in_rack
    @options = {}
    @app = new_app
    start_file_watcher
  end
end

Middleman::PreviewServer.preview_in_rack

run Middleman::PreviewServer.app
