include_recipe 'runit'

application 'node-tail' do
  path '/usr/local/www/node-tail'
  repository 'https://github.com/trotttrotttrott/node-tail.git'
  owner 'travis'
  group 'travis'

  create_dirs_before_symlink(['tmp'])
  symlinks({ 'log' => 'log', 'settings.yml' => 'config/settings.yml', 'tmp/pids' => 'tmp/pids', 'tmp/sockets' => 'tmp/sockets' })

  unicorn do
  end
end
