class RandomNumber
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, response << "#{rand(1000)}"]
    # [200, {'Content-Type' => 'text/html'}, ["#{rand(100)}"]]
  end
end
