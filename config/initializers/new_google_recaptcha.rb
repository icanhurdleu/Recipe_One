if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = "6Lf5TYAaAAAAALt5rsPrPpsfqc-x0HLNJyqK1bWH"
    config.secret_key = "6Lf5TYAaAAAAAKu86IliCtyKrxGtPbt6ZIVIHhUb"
    config.minimum_score = 0.5
  end
end
