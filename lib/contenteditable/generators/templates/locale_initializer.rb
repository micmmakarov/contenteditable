require 'i18n/backend/active_record'

# Create an ActiveRecord backend
new_backend = I18n::Backend::ActiveRecord.new

# Chain the new backend in front of the default backend
I18n.backend = I18n::Backend::Chain.new(new_backend, I18n.backend)

# this can get fancy!
# see https://github.com/svenfuchs/i18n-active_record
