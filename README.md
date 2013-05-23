# Rack::Fake::Method

Flash does not support any other messages than ``GET`` and ``POST`` with it's ``URLLoader`` class. This middleware allows any application to accept an incoming ``POST`` request to act as a request with a different HTTP method. Just set the ``FAKE-METHOD`` HTTP header to anything you want and the middleware will use that as your HTTP method.

In order to work properly make sure to include the middleware as early as possible in your applications middleware chain.

## Example

```ruby
require 'rack/fake_method'

use Rack::FakeMethod::Middleware
use SomeOtherMiddleware
run YourApp
```