include_recipe 'runit'

application 'rest-tail' do
  path '/usr/local/www/rest-tail'
  repository 'https://github.com/trotttrotttrott/rest-tail.git'
  owner 'travis'
  group 'travis'

  create_dirs_before_symlink(['/shared/log', '/shared/tmp/pids', '/shared/tmp/sockets'])
  symlinks({ 'log' => 'log', 'tmp/pids' => 'tmp/pids', 'tmp/sockets' => 'tmp/sockets' })

  unicorn do
  end
end
