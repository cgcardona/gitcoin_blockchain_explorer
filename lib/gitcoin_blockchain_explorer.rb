'reauire httparty'

module GitcoinBlockchainExplorer
  class Explorer
    attr_accessor :coinbase_api_base, :blockr_api_base, :blockchain_api_base, :cex_api_base

    def initialize()
      self.coinbase_api_base = 'https://coinbase.com/api/v1/'
      self.blockr_api_base = 'http://blockr.io/api/v1/'
      self.blockchain_api_base = 'http://blockchain.info/'
      self.cex_api_base = 'https://cex.io/api/'
    end


    def last_block()
      HTTParty.get("#{self.blockr_api_base}coin/info")['data']
    end

    def last_blocks(number_of_blocks = 5)
      #HTTParty.get("#{Figaro.env.blockr_api_base}block/info/#{last_block_num},#{last_block_num - 1},#{last_block_num - 2},#{last_block_num - 3},#{last_block_num - 4},#{last_block_num - 5}")['data']
      HTTParty.get("#{self.blockr_api_base}block/info/#{HTTParty.get("#{self.blockr_api_base}coin/info")['data']['last_block']['nb']}")['data']
    end

    def last_transactions(number_of_transactions = 10)
      HTTParty.get("#{self.blockr_api_base}block/txs/last")
    end

    def block(block_number)
      HTTParty.get("#{self.blockr_api_base}block/info/#{block_number}")
    end

    def block_transactions(block_number)
      HTTParty.get("#{self.blockr_api_base}block/txs/#{block_number}")
    end

    def transaction(transaction_hash)
      HTTParty.get("#{self.blockr_api_base}tx/info/#{transaction_hash}")
    end
        
    def address(public_address)
      HTTParty.get("#{Figaro.env.blockr_api_base}address/info/#{public_address}")
    end
        
    def address_transactions(public_address)
      HTTParty.get("#{Figaro.env.blockr_api_base}address/txs/#{public_address}")
    end
  end
end
