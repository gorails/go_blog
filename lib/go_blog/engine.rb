require File.expand_path('../boot', __FILE__)

require 'rails/all'
module GoBlog
  class Engine < ::Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib/modules)
    initializer :append_migrations do |app|
      # This prevents migrations from being loaded twice from the inside of the
      # gem itself (dummy test app)
      if app.root.to_s !~ /#{root}/
        config.paths['db/migrate'].expanded.each do |migration_path|
          app.config.paths['db/migrate'] << migration_path
        end
      end
    end
  end
end
