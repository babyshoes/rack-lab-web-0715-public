class RequestMethod
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, response << env["REQUEST_METHOD"]]
    # [200, {'Content-Type' => 'text/html'}, ["GET"]]
  end
end
