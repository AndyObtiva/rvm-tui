$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

puts "== rvm-tui version #{File.read(File.expand_path('../../VERSION', __FILE__)).strip} =="

require 'tty-prompt'

CURRENT_RVM_RUBY = ARGV[0]
CURRENT_RVM_GEMSET = ARGV[1] || 'default'
current_rvm = CURRENT_RVM_RUBY
current_rvm += "@#{CURRENT_RVM_GEMSET}" unless CURRENT_RVM_GEMSET.nil?
CURRENT_RVM = current_rvm
puts "Current: #{CURRENT_RVM}"

RVM_COMMAND_PREFIX = <<~SHELL_SCRIPT
  # Load RVM into a shell session *as a function*
  if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
    # First try to load from a user install
    source "$HOME/.rvm/scripts/rvm"
  elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
    # Then try to load from a root install
    source "/usr/local/rvm/scripts/rvm"
  else
    printf "ERROR: An RVM installation was not found.\\n"
  fi  
  rvm use #{CURRENT_RVM_RUBY}@#{CURRENT_RVM_GEMSET}
SHELL_SCRIPT

def rvm_command(command)
  `bash -c '#{RVM_COMMAND_PREFIX}\n#{command}'`
end

begin
  prompt = TTY::Prompt.new  
  rvm_list_lines = rvm_command('rvm list').split("\n")
  rvm_list_lines.shift if rvm_list_lines.first.start_with?('Using ')
  rubies = rvm_list_lines[0...-4] # TODO print excluded lines as an appendix
  rubies_help = rvm_list_lines[-4..-1].join("\n") + "\n"
  ruby = prompt.select("Choose a Ruby: ", rubies, cycle: true, per_page: 40, filter: true, help: "\n#{rubies_help}", show_help: :always)
  
  ruby = ruby.split.detect {|text| text.include?('ruby')}
  rvm_gemset_list = nil
  if CURRENT_RVM_RUBY == ruby
    rvm_gemset_list = rvm_command('rvm gemset list')
  else
    rvm_gemset_list = rvm_command("rvm #{ruby} do rvm gemset list")
  end
  rvm_gemset_list_lines = rvm_gemset_list.split("\n")
  rvm_gemset_list_lines.shift if rvm_gemset_list_lines.first.start_with?('Using ')
  gemsets = rvm_gemset_list_lines[2..-1]
  gemsets_help = rvm_gemset_list_lines[0..1].join("\n") + "\n"
  gemset = prompt.select("Choose a Gemset: ", gemsets, cycle: true, per_page: 40, filter: true, help: gemsets_help, show_help: :always)
  
  gemset = gemset.sub('=>', '').sub('(default)', 'default').strip
  
  command = "rvm --nice use #{ruby}@#{gemset}"
  
  home_dir = `echo ~`.strip
  File.write("#{home_dir}/.rvm_command", command)
rescue TTY::Reader::InputInterrupt => e
  # No Op
  puts # a new line is needed
  puts "Staying at current (abort detected): #{CURRENT_RVM}"
end
