require 'rake/testtask'

# These help us automate the common tasks when working with Ruby.
#

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList["tests/test*.rb"]
  t.verbose = true
end
