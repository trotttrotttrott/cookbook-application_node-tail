include_recipe 'runit'

application 'rest-tail' do
  path '/usr/local/www/rest-tail'
  repository 'https://github.com/trotttrotttrott/rest-tail.git'

  unicorn do
  end
end
