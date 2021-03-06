# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gator-as3}
  s.version = "0.0.7.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominic Graefen"]
  s.date = %q{2011-08-16}
  s.description = %q{gator-as3 - ActionScript3 & MXML generators for gator}
  s.email = %q{dominic.graefen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "gator-as3.gemspec",
    "lib/gator/as3.rb",
    "lib/gator/as3/generators.rb",
    "lib/gator/as3/generators/collection.rb",
    "lib/gator/as3/generators/klass.as.tt",
    "lib/gator/as3/generators/klass.rb",
    "lib/gator/as3/generators/test/asunit4.rb",
    "lib/gator/as3/generators/test/asunit4/collection.rb",
    "lib/gator/as3/generators/test/asunit4/klass.as.tt",
    "lib/gator/as3/generators/test/asunit4/klass.rb",
    "lib/gator/as3/generators/test/flexunit4.rb",
    "lib/gator/as3/generators/test/flexunit4/collection.rb",
    "lib/gator/as3/generators/test/flexunit4/klass.as.tt",
    "lib/gator/as3/generators/test/flexunit4/klass.rb",
    "spec/generators/collection_spec.rb",
    "spec/generators/klass_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/devboy/gator-as3}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{gator-as3 - ActionScript3 & MXML generators for gator}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gator>, ["~> 0.0.20.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<ci_reporter>, ["~> 1.6.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<gator>, ["~> 0.0.20.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<ci_reporter>, ["~> 1.6.5"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<gator>, ["~> 0.0.20.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<ci_reporter>, ["~> 1.6.5"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

