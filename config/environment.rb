# Load the Rails application.
require_relative 'application'

REDIS_CONFIG = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
# Initialize the Rails application.
Rails.application.initialize!

