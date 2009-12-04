require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
 
  require 'webrat'
 
  Webrat.configure do |config|
    config.mode = :rails
  end
 
  require 'webrat/core/matchers'
  require 'cucumber'
  require 'cucumber/formatter/unicode'
  require 'spec/rails'
  require 'cucumber/rails/rspec'
  require 'factory_girl'
  require 'culerity'
  $server ||= Culerity::run_server
  $browser = Culerity::RemoteBrowserProxy.new $server, {:browser => :firefox}
  $browser.webclient.setJavaScriptEnabled(true)
  require "#{RAILS_ROOT}/test/factories.rb"
  require "#{RAILS_ROOT}/db/bootstrap.rb"
end

Spork.each_run do
  Cucumber::Rails.bypass_rescue
end

require 'fileutils'
FileUtils.touch "#{RAILS_ROOT}/tmp/restart.txt"

@@cucumber_cli_test_number = 1

Before do
  puts "--- TEST ##{@@cucumber_cli_test_number} ---"
  @@cucumber_cli_test_number += 1
  Bootstrapper.run :test
end

def print_page_on_error(*args, &block)
  begin
    yield
  rescue
    open_current_html_in_browser_
    raise
  end
end
