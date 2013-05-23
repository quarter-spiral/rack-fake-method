module Rack
  module FakeMethod
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        switch_method_to!(env, fake_method(env)) if post?(env) && fake_method(env)

        @app.call(env)
      end

      protected
      def post?(env)
        env['REQUEST_METHOD'] == 'POST'
      end

      def fake_method(env)
        env['HTTP_FAKE_METHOD']
      end

      def switch_method_to!(env, method)
        env['REQUEST_METHOD'] = method
      end
    end
  end
end