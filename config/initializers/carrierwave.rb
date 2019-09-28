CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAW4NISNVNDOPRDEXD',
      aws_secret_access_key: '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',
      region: 'us-east-1'
    }
    config.storage :fog
    config.fog_directory  = 'etf-image'
    config.cache_storage = :fog
  end
