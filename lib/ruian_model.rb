require "ruian_model/version"
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

    def load_models
      configure_db
      require 'ruian_model/adresni_posta'
      require 'ruian_model/adresni_misto'
      require 'ruian_model/cast_obce'
      require 'ruian_model/katastralni_uzemi'
      require 'ruian_model/kraj'
      require 'ruian_model/momc'
      require 'ruian_model/obec'
      require 'ruian_model/okres'
      require 'ruian_model/orp'
      require 'ruian_model/parcela'
      require 'ruian_model/pou'
      require 'ruian_model/stavebni_objekt'
      require 'ruian_model/ulice'
      require 'ruian_model/version'
      require 'ruian_model/vusc'
    end

    def configure_db
      return unless ActiveRecord::Base.configurations.empty?
      db_config = YAML.load(File.read(root + '/config/database.yml'))
      ActiveRecord::Base.configurations = db_config
      ActiveRecord::Base.establish_connection(env.intern)
    end

    def setup
      load_models
      Vusc.connection
      true
    end
  end
end
