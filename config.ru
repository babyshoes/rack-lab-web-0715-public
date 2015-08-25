require_relative 'config/environment'
require_relative 'app/controllers/server_port'
require_relative 'app/controllers/random_number'
require_relative 'app/controllers/erb_maker'
require_relative 'app/application'

use ErbMaker
use RandomNumber
use RequestMethod
use ServerPort
run Application.new
