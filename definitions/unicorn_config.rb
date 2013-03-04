define :unicorn_config do

  config_dir = File.dirname(params[:name])

  directory config_dir do
    recursive true
    action :create
  end

  template params[:name] do
    source "unicorn.rb.erb"
    mode "0644"
    owner params[:owner]
    group params[:group]
  end
end
