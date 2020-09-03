$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

puts "rvm-tui version #{File.read(File.expand_path('../../VERSION', __FILE__))}"
puts

require "tty-prompt"

prompt = TTY::Prompt.new

rvm_list_lines = `rvm list`.split("\n")
rubies = rvm_list_lines[0...-4] # TODO print excluded lines as an appendix
rubies_help = rvm_list_lines[-4..-1].join("\n") + "\n"
ruby = prompt.select("Choose a Ruby version: ", rubies, cycle: true, per_page: 40, filter: true, help: "\n#{rubies_help}", show_help: :always)

ruby = ruby.split.detect {|text| text.include?('ruby')}
rvm_gem_list_lines = `rvm use #{ruby} do rvm gemset list`.split("\n")
gemsets = rvm_gem_list_lines[2..-1]
gemsets_help = rvm_gem_list_lines[0..1].join("\n") + "\n"
gemset = prompt.select("Choose a gemset: ", gemsets, cycle: true, per_page: 40, filter: true, help: gemsets_help, show_help: :always)

gemset = gemset.strip

command = "rvm --nice use #{ruby}"
command += "@#{gemset}" unless gemset.include?('(default)')

home_dir = `echo ~`.strip
File.write("#{home_dir}/.rvm-command", command)
