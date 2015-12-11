source 'https://rubygems.org'


# Specify your gem's dependencies in init.gemspec
gemspec

ruby '2.2.2'

__END__
gem 'pg'

gem 'activesupport',    '4.2.5'
gem 'activerecord',     '4.2.5'
gem "strip_attributes", "~> 1.2"

group :test, :development do
  gem 'annotate', ">= 2.5.0"
  gem 'rspec-rails' #, '~> 3.0'
end

group :test do
  gem 'factory_girl'
  gem 'database_cleaner'
  gem 'webmock'
end

group :production do
  gem 'exception_notification'
  #gem 'unicorn-worker-killer'
end

gem 'dragonfly', git: 'https://github.com/zorec/dragonfly.git', branch: 'relative_redirect'
gem 'dragonfly-s3_data_store'
group :production do
    gem 'rack-cache', :require => 'rack/cache'
end

#gem 'sidekiq'

