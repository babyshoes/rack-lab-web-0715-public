class ServerPort
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, response << env["SERVER_PORT"]]
    # [200, {'Content-Type' => 'text/html'}, [env["SERVER_PORT"]]]
  end
end
