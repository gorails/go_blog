require 'rails/all'
module GoBlog
  class Engine < ::Rails::Engine

    initializer :append_migrations do |app|
      # This prevents migrations from being loaded twice from the inside of the
      # gem itself (dummy test app)
      if app.root.to_s !~ /#{root}/
        config.paths['db/migrate'].expanded.each do |migration_path|
          app.config.paths['db/migrate'] << migration_path
        end
      end
    end

    config.i18n.default_locale = :'pt-BR'
    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = 'Brasilia'
    config.i18n.load_path += Dir[config.root.join('config', 'locales','**', '*.{rb,yml}').to_s]
    config.encoding = "utf-8"
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

  end

end
