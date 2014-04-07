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
      puts 'last_block called'
    end

    def last_blocks(number_of_blocks)
      puts "last_blocks called with #{number_of_blocks}"
    end

    def last_transactions(number_of_transactions)
      puts "last_transactions called with #{number_of_transactions}"
    end

    def block(block_number)
      puts "block called with #{block_number}"
    end

    def block_transactions(block_number)
      puts "block_transactions called with #{block_number}"
    end
        
    def address(public_address)
      puts "address called with #{public_address}"
    end
  end
end
