require "init/version"

require 'yaml'
require 'active_record'

module RuianModel
  class << self
    def env
      ENV['ENV'] || ENV['RAILS_ENV'] || 'development'
    end

    def root
      File.expand_path('..', '__FILE__')
    end

    def setup
      db_config = YAML.load(File.read(root + '/config/database.yml'))
      ActiveRecord::Base.configurations = db_config
      ActiveRecord::Base.establish_connection(env.intern)

      Dir[File.join(root, 'app/models/*.rb')].each do |model_file|
        require model_file
      end

      Vusc.connection
      true
    end
  end
end
