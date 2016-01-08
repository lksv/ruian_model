$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['ENV'] = 'test'

require 'ruian_model'

RuianModel.setup
