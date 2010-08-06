
ARGV << "--readline"

require 'pp'
require 'rubygems'
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "wirble gem not available"
end

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true


