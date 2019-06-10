require './config/environment'

use Rack::MethodOverride

use UsersController
use RequestsController
use JobsController
run AppController