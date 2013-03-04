include Chef::Resource::ApplicationBase

attribute :preload_app, :kind_of => [TrueClass, FalseClass], :default => false
attribute :worker_processes, :kind_of => Integer, :default => [node['cpu']['total'].to_i * 4, 8].min
attribute :before_fork, :kind_of => String, :default => 'sleep 1'
attribute :port, :kind_of => String, :default => "8080"
attribute :worker_timeout, :kind_of => Integer, :default => 60
attribute :bundler, :kind_of => [TrueClass, FalseClass, NilClass], :default => nil
attribute :bundle_command, :kind_of => [String, NilClass], :default => nil

def options(*args, &block)
  @options ||= Mash[:tcp_nodelay => true, :backlog => 100]
  @options.update(options_block(*args, &block))
end
