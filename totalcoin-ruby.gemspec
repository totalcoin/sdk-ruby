# encoding: utf-8
Gem::Specification.new do |spec|
  spec.name              = "totalcoin-ruby"
  spec.version           = "0.0.1"
  spec.summary           = "TotalCoin - Ruby SDK"
  spec.description       = "Ruby SDK para interactuar con TotalCoin\nhttps://www.totalcoin.com.ar/"
  spec.authors           = ["Ezequiel Maraschio"]
  spec.email             = ["ezequiel.maraschio@gmail.com","contacto@totalcoin.com.ar"]
  spec.homepage          = "https://www.totalcoin.com.ar/"

  spec.executables.push("totalcoin")
  spec.add_dependency('rest-client', '~> 1.7')
  spec.add_dependency('json')

  spec.files = %w{
    lib/totalcoin.rb
  }

  spec.test_files = %w{
    test/totalcoin_test.rb
  }

end
