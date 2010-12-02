
ARGV << "--readline"
IRB.conf[:USE_READLINE] = true

require 'pp'
require 'rubygems'

def try_require(lib, &block)
  begin
    require lib
    yield if block_given?
  rescue LoadError
    warn "#{lib} gem not available"
  end
end

try_require 'wirble' do
  Wirble.init
  Wirble.colorize
end

try_require 'hirb' do
  Hirb::View.enable
end

try_require 'ap'

try_require 'irb/completion'
#try_require 'irb/ext/completion'
try_require 'irb/ext/save-history' do
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
end

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true

if defined? Rails

  env = ENV['RAILS_ENV'] || Rails.env
  # Display the RAILS ENV in the prompt
  # ie : [Development]>>
  IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_N => "[#{env.capitalize}]>> ",
  :PROMPT_I => "[#{env.capitalize}]>> ",
  :PROMPT_S => nil,
  :PROMPT_C => "?> ",
  :RETURN => "=> %s\n"
  }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM

  require 'logger'
  @logger = Logger.new(STDOUT)

  # Log to STDOUT if in Rails 2
  if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    RAILS_DEFAULT_LOGGER = @logger
  end

  # Log to STDOUT if in Rails 3
  if Rails.respond_to?(:logger)
    Rails.logger = @logger
    ActiveRecord::Base.logger = @logger
  end

end

