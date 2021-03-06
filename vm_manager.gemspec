# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vm_manager}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gary Taylor"]
  s.date = %q{2010-07-06}
  s.description = %q{This gem provides a common interface to many different types of virtual machine.  The use case that it was written for is when you need an external system as part of your test procedures.  Using a virtual machine with snapshot capabilities is extremely useful as you can reset the virtual machine to a known state at the start of every test.}
  s.email = %q{gary.taylor@rubysystems.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".idea/.rakeTasks",
     ".idea/vcs.xml",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/vm_manager.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/virtual_machines/virtual_machine_spec.rb",
     "spec/vm_manager_spec.rb",
     "vm_manager.gemspec"
  ]
  s.homepage = %q{http://github.com/garytaylor/vm_manager}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A ruby API to many virtual machine types}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/virtual_machines/virtual_machine_spec.rb",
     "spec/vm_manager_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

