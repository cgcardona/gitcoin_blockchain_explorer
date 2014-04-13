module GitcoinBlockchainExplorer
  class BlockchainController < ApplicationController
    def index
      puts 'from the index'
    end
  
    def search
      puts 'from the search'
    end
  
    def block
      puts 'from the block'
    end
  
    def transaction
      puts 'from the transaction'
    end
  
    def address
      puts 'from the address'
    end
  end
end
