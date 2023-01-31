require './lib/terminal_display'
require './lib/writer_script'

task :default do
  puts 'Not yet implemented'
end

desc 'Write a fixed state to file'
task :writer do
  WriterScript.write_points
end

task :display do
  td = TerminalDisplay.new
  td.output
end

# task :run_display do
#   puts 'Run up writer and display'
# end
