#coding: utf-8
# expand_path gives the Absolute Path of the relative path of "../lib" and the current file
# __file__ is a reference to the current file name
library = File.expand_path("../lib", __FILE__)
#$LOAD_PATH is synonomous with  $: this is for scripts and binary modules by load or require
#unshift lib prepends the absolute path to the loadpath unless it already has prepended it
$LOAD_PATH.unshift(library) unless $LOAD_PATH.include?(library)

Gem::Specification.new do |spec|
  #name
  spec.name = "mvcreate"
  #version
  spec.version = "1.0"
  #authors
  spec.authors = ["Edozie Izegbu"]
  #email
  spec.email = ["edzye101@gmail.com"]
  #summary
  spec.summary = %q{This Gem is going to allow you to simply create a lightweight mvc framework}
  #description
  spec.description = %q{Longer description of your project.}
  #homepage
  spec.homepage = "http://gems.zegdev.com"
  #license
  spec.license = "MIT"


  #files
  spec.files = ["lib/mvcreate.rb"]
  #executable binaries
  spec.executables = ["bin/mvcreate"]
  #test files
  spec.test_files = ["tests/test_mvcreate.rb"]
  #require paths
  spec.require_paths = ["lib"]


  end
