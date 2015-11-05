These are the steps to creating thorough and good, tests, 

	0. Create a Rakefile which uses the class rake from the rake library. You will want to, 
	require 'rake/testtask' 
	#then get the use the TestTasks libs , and test_files and verbose functions to set your 
	# tests ups
	Rake::TestTask.new do |b| 
	b.libs << "test directory name [always 'tests']"
	b.test_files = FileList['tests/test*.rb'] 
	# this gets every test  that is named test_something.rb and sets it to TestTask.new.test_files
	b.verbose = true
	# this sets the verbose attribute of test to true.
	end


	1. Test files go into the tests/ directory and are name test_Blah.rb
	   otherwise rake test WILL NOT RUN [tests/test_whatever.rb]

	1.I Test files will require all the files that you need to make them run and so on.
	  they aslo require "test/unit", the class for the test is Test_whateverprog < 
	Test::Unit::TestCase 
	

	2.Write one test file for each module  you make. 
	  reminger that each test file should contain differnt , methdos to describe what exactly
	  your method does, and a larger test method should can encapsulate what youre doing
	3. Kepp test cases (def test_func;end ) methods , short but do not worry if they are a bit
	  messy , Test cases are usually a bit messy.
	4. Even though test cases are messy, try to keep them CLEAN and remove any repetitive code
 	   you can. Create helper. functions that get rid of duplicate code. You will thank me later
 	   when you make a change and then have to change your tests. Duplicated code will make 
	   changing your tests more difficult
	5. Do not get too attached to your tests. Sometimes. the best way to redesign something is 
	   to just start over and delete it.

	
	
	
