CarrierWave.configure do |config|
    if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.storage :fog
    config.asset_host = 'https://www.easytofind.tk/etf-image'
    config.fog_public = false
    config.fog_directory  = 'etf-image'
    config.cache_storage = :fog
    end
  end
