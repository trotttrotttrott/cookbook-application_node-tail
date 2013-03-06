action :before_compile do
end

action :before_deploy do

  %w(log bundle tmp/pids tmp/sockets).each do |dir|
    directory "#{new_resource.path}/shared/#{dir}" do
      owner new_resource.owner
      group new_resource.group
      mode '0755'
      recursive true
    end
  end

  template "#{new_resource.path}/shared/settings.yml" do
    source "settings.yml.erb"
    owner new_resource.owner
    group new_resource.group
    mode '644'
  end
end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do
  new_resource = @new_resource
  unicorn_config "/etc/unicorn/#{new_resource.name}.rb"
  Chef::Log.info "Running bundle install"
  execute "bundle install --path=#{new_resource.path}/shared/bundle --without development,test" do
    cwd new_resource.release_path
    user new_resource.owner
    environment new_resource.environment
  end
end

action :after_restart do
end
