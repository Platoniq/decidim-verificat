# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION
DECIDIM_BRANCH = "release/0.26-stable"
DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: DECIDIM_BRANCH }.freeze

gem "decidim", DECIDIM_VERSION
# gem "decidim-conferences", DECIDIM_VERSION
# gem "decidim-consultations", DECIDIM_VERSION
# gem "decidim-elections", DECIDIM_VERSION
# gem "decidim-initiatives", DECIDIM_VERSION
# gem "decidim-templates", DECIDIM_VERSION

gem "decidim-access_codes", git: "https://github.com/Platoniq/decidim-module-access_codes"
gem "decidim-decidim_awesome", git: "https://github.com/decidim-ice/decidim-module-decidim_awesome"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: DECIDIM_BRANCH

gem "bootsnap", "~> 1.3"

gem "puma", ">= 5.0.0"

gem "faker", "~> 2.14"

gem "wicked_pdf", "~> 2.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman"
  gem "decidim-dev", DECIDIM_VERSION
  gem "rubocop-faker"
end

group :development do
  gem "capistrano", "~> 3.15"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails"
  gem "capistrano-rails-console"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 4.0"
end

group :production do
  gem "figaro"
  gem "passenger"
  gem "sidekiq"
  gem "sidekiq-cron"
end
