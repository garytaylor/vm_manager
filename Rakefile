require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "vm_manager"
    gem.summary = %Q{A ruby API to many virtual machine types}
    gem.description = %Q{This gem provides a common interface to many different types of virtual machine.  The use case that it was written for is when you need an external system as part of your test procedures.  Using a virtual machine with snapshot capabilities is extremely useful as you can reset the virtual machine to a known state at the start of every test.}
    gem.email = "gary.taylor@rubysystems.co.uk"
    gem.homepage = "http://github.com/garytaylor/vm_manager"
    gem.authors = ["Gary Taylor"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "net-ssh", ">=2.0.0"
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "vm_manager #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
