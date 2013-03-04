include Chef::Mixin::LanguageIncludeRecipe

action :before_compile do
end

action :before_deploy do
end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do
  new_resource = @new_resource
  unicorn_config "/etc/unicorn/#{new_resource.name}.rb"
  Chef::Log.info "Running bundle install"
  execute 'bundle install --path=vendor/bundle --without development,test' do
    cwd new_resource.release_path
    user new_resource.owner
    environment new_resource.environment
  end
end

action :after_restart do
end
