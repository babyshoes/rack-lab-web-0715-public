require 'pry'
class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    if env["PATH_INFO"] == '/about'
      response_if_lost = "<h1><a href='/'>Are you lost?</a></h1>"
      [status, headers, [response_if_lost]]
    else
      template = File.read('lib/templates/index.html.erb')
      erb = ERB.new(template).result(binding)
      [status, headers, [erb]]
    end
  end

end
