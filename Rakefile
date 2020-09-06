# encoding: utf-8

# Copyright (c) 2020 Andy Maleh
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "rvm-tui"
  gem.homepage = "http://github.com/AndyObtiva/rvm-tui"
  gem.license = "Apache-2.0"
  gem.summary = %Q{Ruby enVironment Manager - Text-based User Interface}
  gem.description = %Q{Ruby enVironment Manager - Text-based User Interface}
  gem.email = "andy.am@gmail.com"
  gem.authors = ["andy_maleh"]
  gem.executables = ['rvm-tui-setup']
  gem.files = Dir['README.md', 'LICENSE.txt', 'VERSION', 'bin/**/*', 'lib/**/*']
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rvm-tui #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
