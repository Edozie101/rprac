require 'rack'
require 'rack/static'

use Rack::Static,
  :url => ['/images','/css'],
  :root => 'public'
app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, [File.open("public/rprac.html", File::RDONLY)]]
end

Rack::Handler::WEBrick.run app
