Rake does unit tests and the deployment tasks

Tasks have name

task :symbol => [:method1, :method2, :method3] do

	puts "make symbol"
end


- task :compile do 
	puts "Compiling the application"

end


Compliling and Running , removing files , and easy repetetive tasks.

desc "remove dotfiles"
task :runnecessary do 
	`rm -rf */.dotfiles`
end

 
