OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '161364124425890', '39ebc641e701b6d9835f7e720081c1d5'
end
