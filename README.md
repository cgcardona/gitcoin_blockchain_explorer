# Gitcoin Blockchain Explorer

The blockchain explorer found at [https://www.gitcoin.co/blockchain](https://www.gitcoin.co/blockchain) as a gem.

## Installation

In your Gemfile

```ruby
gem 'gitcoin_blockchain_explorer'
gem 'httparty'
```

We are using `httparty` for the webservice calls to the api endpoints

And then execute

`bundle`

## Usage

### Create an instance

```ruby
blockchain_explorer = GitcoinBlockchainExplorer::Explorer.new()
```

### Methods

```ruby
last_block()
last_blocks(number_of_blocks = 5)
last_transactions(number_of_transactions = 10)
block(block_number)
block_transactions(block_number)
transaction(transaction_hash)
address(public_address)
address_transactions(public_address)
```

### Examples

```ruby
require 'gitcoin_blockchain_explorer'
require 'httparty'

blockchain_explorer = GitcoinBlockchainExplorer::Explorer.new()
=> #<GitcoinBlockchainExplorer::Explorer:0x00848484848484 @coinbase_api_base="https://coinbase.com/api/v1/", @blockr_api_base="http://blockr.io/api/v1/", @blockchain_api_base="http://blockchain.info/", @cex_api_base="https://cex.io/api/">

blockchain_explorer.last_block()
=> #{"coin"=>{"name"=>"Bitcoin", "abbr"=>"BTC", "logo"=>"", "homepage"=>""}, "volume"=>{"current"=>12614800, "all"=>21000000, "perc"=>60.07}, "markets"=>{"bitstamp"=>{"name"=>"Bitstamp", "last_update_utc"=>"2014-04-07T04:09:45Z", "value"=>458.21, "currency"=>"USD"}, "btce"=>{"name"=>"BTC-e", "last_update_utc"=>"2014-04-07T04:10:02Z", "value"=>456.5, "currency"=>"USD"}, "coinbase"=>{"name"=>"Coinbase", "last_update_utc"=>"2014-04-07T04:10:02Z", "value"=>459.17, "currency"=>"USD"}, "campbx"=>{"name"=>"CampBX", "last_update_utc"=>"2014-04-07T04:10:02Z", "value"=>469.69, "currency"=>"USD"}, "justcoin"=>{"name"=>"Justcoin", "last_update_utc"=>"2014-04-07T04:10:03Z", "value"=>449.227, "currency"=>"USD"}}, "last_block"=>{"nb"=>294594, "time_utc"=>"2014-04-07T04:11:29Z", "nb_txs"=>1077, "fee"=>"0.22308842", "difficulty"=>"6119726089.128100000000000"}, "next_difficulty"=>{"difficulty"=>6340454174.0369, "retarget_in"=>1758, "retarget_block"=>296352, "perc"=>3.606829483773}}

blockchain_explorer.last_blocks(5)
=> #{"nb"=>294595, "hash"=>"000000000000000012ce5d9143fb0c6227b129f60b6c2173fbb48a4cb3daa5a3", "version"=>2, "confirmations"=>1, "time_utc"=>"2014-04-07T04:17:46Z", "nb_txs"=>566, "merkleroot"=>"e3c36c6f5db02b80f317f98f4a398c58fbe6bf5875e001d397919e70c72ca2cf", "next_block_nb"=>false, "prev_block_nb"=>294594, "next_block_hash"=>"", "prev_block_hash"=>"000000000000000040b6544b193861aed611ef33b26bbcfd3c6a4dc9988460c1", "fee"=>"0.10494836", "vout_sum"=>2095.09962976, "size"=>"349203", "difficulty"=>6119726089.1281, "days_destroyed"=>1400.94, "extras"=>nil}

blockchain_explorer.last_transactions(10)

blockchain_explorer.block(507)
=> #{"nb"=>507, "hash"=>"000000001c6aeec19265e9cc3ded8ba5ef5e63fae7747f30bf9c02c7bc8883f0", "version"=>1, "confirmations"=>294090, "time_utc"=>"2009-01-14T22:54:16Z", "nb_txs"=>1, "merkleroot"=>"a85fa3d831ab6b0305e7ff88d2d4941e25a810d4461635df51490653822071a8", "next_block_nb"=>508, "prev_block_nb"=>506, "next_block_hash"=>"000000000d550f4161f2702165fdd782ec72ff9c541f864ebb8256b662b7e51a", "prev_block_hash"=>"00000000a99525c043fd7e323414b60add43c254c44860094048f9c01e9a5fdd", "fee"=>"0.00000000", "vout_sum"=>50, "size"=>"216", "difficulty"=>1, "days_destroyed"=>0, "extras"=>nil}

blockchain_explorer.block_transactions(507)

blockchain_explorer.transaction('0cb7a777d4dc4bd7ef663492e5b488d1f10fd4d1fea3abc9b642b880b63b2420')
=> #{"tx"=>"0cb7a777d4dc4bd7ef663492e5b488d1f10fd4d1fea3abc9b642b880b63b2420", "block"=>294594, "confirmations"=>3, "time_utc"=>"2014-04-07T04:11:29Z", "is_coinbased"=>0, "trade"=>{"vins"=>[{"address"=>"1PFBGeyAUH6ncVXmW3F7AYC1ieNGz9Fuks", "is_nonstandard"=>false, "amount"=>-360.0001, "n"=>1, "type"=>0, "vout_tx"=>"e50649d997d347b17d1c7876e4604e2fc0d2fa84367ddfec91899c84e9ccc375"}], "vouts"=>[{"address"=>"1ASy16s7nQr4LSjYp5qNvey2xAuZfu2WpA", "is_nonstandard"=>false, "amount"=>360, "n"=>0, "type"=>1, "is_spent"=>1}]}, "vins"=>[{"address"=>"1PFBGeyAUH6ncVXmW3F7AYC1ieNGz9Fuks", "is_nonstandard"=>false, "amount"=>"-1030.30289696", "n"=>1, "type"=>0, "vout_tx"=>"e50649d997d347b17d1c7876e4604e2fc0d2fa84367ddfec91899c84e9ccc375"}], "vouts"=>[{"address"=>"1ASy16s7nQr4LSjYp5qNvey2xAuZfu2WpA", "is_nonstandard"=>false, "amount"=>"360.00000000", "n"=>0, "type"=>1, "is_spent"=>1, "extras"=>{"asm"=>"OP_DUP OP_HASH160 67a2476c86d6103ef7d1039b31e45673dffa1337 OP_EQUALVERIFY OP_CHECKSIG", "script"=>"76a91467a2476c86d6103ef7d1039b31e45673dffa133788ac", "reqSigs"=>1, "type"=>"pubkeyhash"}}, {"address"=>"1PFBGeyAUH6ncVXmW3F7AYC1ieNGz9Fuks", "is_nonstandard"=>false, "amount"=>"670.30279696", "n"=>1, "type"=>1, "is_spent"=>1, "extras"=>{"asm"=>"OP_DUP OP_HASH160 f40129e15e1df9b0b539bc5144d62f0b8f5664e4 OP_EQUALVERIFY OP_CHECKSIG", "script"=>"76a914f40129e15e1df9b0b539bc5144d62f0b8f5664e488ac", "reqSigs"=>1, "type"=>"pubkeyhash"}}], "fee"=>"0.00010000", "days_destroyed"=>"815.66", "is_unconfirmed"=>false, "extras"=>nil} 

blockchain_explorer.address('19T5kws9a7J4wgqk1qFE6U9uPxd8sK1Ad4') 
=> #{"address"=>"19T5kws9a7J4wgqk1qFE6U9uPxd8sK1Ad4", "is_unknown"=>false, "balance"=>0, "totalreceived"=>0.00178381, "nb_txs"=>2, "first_tx"=>{"time_utc"=>"2014-04-03T10:16:18Z", "tx"=>"4781290ddd8dfb6b04d0423c7f56d313752060749a5d7dbdfcea04cb12e0fadd", "block_nb"=>"293942", "value"=>0.00178381, "confirmations"=>655}, "last_tx"=>{"time_utc"=>"2014-04-03T17:47:39Z", "tx"=>"9051df0151dd0c2cc339e6cf418cde4ead1c09b0c04a2db910a518dd0403ab7e", "block_nb"=>"294001", "value"=>-0.00178381, "confirmations"=>596}, "is_valid"=>true}

blockchain_explorer.address_transactions('19T5kws9a7J4wgqk1qFE6U9uPxd8sK1Ad4')
```
