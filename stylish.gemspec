$:.push File.expand_path('../lib', __FILE__)
require 'stylish/version'

Gem::Specification.new do |spec|
  spec.name        = 'stylish'
  spec.version     = Stylish::VERSION

  spec.authors     = ['Yury Matusevich']
  spec.email       = ['yury.a.matusevich@gmail.com']
  spec.homepage    = 'https://github.com/ymatusevich/stylish'
  spec.summary     = 'Database driven web-app styles'
  spec.description = 'Database driven web-app styles'

  spec.license     = 'MIT'

  spec.files       = Dir['{app,config,db,lib}/**/*']
  spec.test_files  = Dir['test/**/*']

  spec.required_ruby_version = '~> 2.3.0'

  spec.add_dependency 'paperclip', '~> 4.3.0'
  spec.add_dependency 'haml-rails', '~> 0.4.0'

  spec.add_dependency(%q<rails>, ['>= 3.2.0'])
  spec.add_dependency(%q<sqlite3>, ['>= 0'])
  spec.add_dependency(%q<rspec-rails>, ['>= 2.8.0'])
  spec.add_dependency(%q<rspec>, ['>= 2.8.0'])
  spec.add_dependency(%q<actionpack>, ['>= 3.2.0'])
end
