# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_ScienceFair_session'

require 'action_dispatch/middleware/session/dalli_store'

Rails.application.config.session_store :dalli_store, :memcache_server => ['host1', 'host2'], :namespace => 'sessions', :key => '_foundation_session', :expire_after => 20.minutes
