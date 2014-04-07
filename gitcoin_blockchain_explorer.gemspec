Gem::Specification.new do |gem|
  gem.name           = 'gitcoin_blockchain_explorer'
  gem.version        = '0.1.3'
  gem.date           = Date.today.to_s
  gem.summary        = "Gitcoin.co's Blockchain Explorer"
  gem.description    = "Gitcoin.co's Blockchain Explorer"
  gem.authors        = ["Carlos Cardona"]
  gem.email          = 'gitcoin.co@gmail.com'
  gem.add_dependency "httparty", ["~> 0.13.0"]
  gem.files          = ["lib/gitcoin_blockchain_explorer.rb"]
  gem.homepage       = 'https://github.com/cgcardona/gitcoin_blockchain_explorer'
  gem.license        = 'MIT'
end
