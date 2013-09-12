source('https://rubygems.org/')
#
# Add runtime dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"
#

gem('candlepin-api',
    :groups	=> [ :default, :development, :test ],
    :path	=> '.')

group(:default) do
  gem('cri',	'> 2.3.0')
  gem('json')
  gem('rest-client')
  gem('versionomy')
end

#
# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
#
group(:test, :development) do
  gem('bundler',	'>= 1.0.0')
  gem('cucumber',	'>= 0')
  gem('rack')
  gem('rake',		'>= 0')
  gem('rdoc',		'>= 0')
  gem('redcarpet',	'< 3.0.0')
  gem('simplecov',	'>= 0',
      :platforms	=> [
                            :mri_19,
                            :mri_20,
                           ])
  gem('debugger',	'>= 0',
      :platforms	=> [
                            :mri_19,
                            :mri_20,
                           ])
  gem('ruby-debug',	'>= 0',
      :platforms	=> [
                            :mri_18,
                           ])
  gem('test-unit',	'>= 0',
      :require		=> 'test/unit')
  gem('yard',		'~> 0.8.6')
end
