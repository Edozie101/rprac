#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "NAME"
  #version
  spec.version = "1.0"
  #authors
  spec.authors = ["Edozie Izegbu"]
  #email
  spec.email = ["edzye101@gmail.com"]
  #summary
  spec.summary = %q{This Gem is going to add some functionality to your life}
  #description
  spec.description = %q{Longer description of your project.}
  #homepage
  spec.homepage = "http://gems.zegdev.com"
  #license
  spec.license = "MIT"


  #files
  spec.files = ["lib/NAME.rb"]
  #executable binaries
  spec.executables = ["bin/NAME"]
  #test filesat
  spec.test_files = ["tests/test_NAME.rb"]
  #require paths
  spec.require_paths = ["lib"]
  spec.add_development_dependency "test-unit"


  end
