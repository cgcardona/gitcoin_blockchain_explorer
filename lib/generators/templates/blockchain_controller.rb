class BlockchainController < ApplicationController
  def index
    blockchain_explorer = GitcoinBlockchainExplorer::Explorer.new()

    @bitcoin_historical_price = blockchain_explorer.historical()
    historical_dates_data = []
    @historical_prices = []
    CSV.parse(@bitcoin_historical_price) do |row|
      historical_dates_data << row[0]
      @historical_prices << row[1]
    end

    @historical_dates = []
    @historical_times = []
    historical_dates_data.each do |date|
      split_date_data = date.split('T')
      split_date = split_date_data[0].split('-')
      split_date.shift

      @historical_dates << split_date.join('-')
      @historical_times << split_date_data[1].split('-')[0]
    end

    counts = Hash.new(0)
    @historical_dates.each { |name| counts[name] += 1 }
    @bitcoin_coin_info_response = HTTParty.get "http://blockr.io/api/v1/coin/info" 
    @bitcoin_spot_price_response = HTTParty.get "http://blockr.io/api/v1/prices/spot_rate"

    last_block_num =  @bitcoin_coin_info_response['data']['last_block']['nb']
    @recently_mined_blocks_response = HTTParty.get("http://blockr.io/api/v1/block/info/#{last_block_num},#{last_block_num - 1},#{last_block_num - 2},#{last_block_num - 3},#{last_block_num - 4}")
    @recent_transactions_response = HTTParty.get("http://blockr.io/api/v1/block/txs/last")
  end

  def search
    #if params[:search_type] == 'block_height'
    #  redirect_to block_path(params[:search].gsub(',', ''))
    #elsif params[:search_type] == 'transaction_hash'
    #  redirect_to blockchain_transaction_path(params[:search])
    #elsif params[:search_type] == 'address'
    #  redirect_to address_path(params[:search])
    #end
  end

  def block
    #@block_info_response = HTTParty.get("http://blockr.io/api/v1/block/info/#{params[:id]}")
    #@block_transactions_response = HTTParty.get("http://blockr.io/api/v1/block/txs/#{params[:id]}")
  end

  def transaction
    #@transaction_info_response = HTTParty.get("http://blockr.io/api/v1/tx/info/#{params[:id]}")
  end

  def address
    #require 'rqrcode'
    #@address_info_response = HTTParty.get("http://blockr.io/api/v1/address/info/#{params[:id]}")
    #@address_transactions_response = HTTParty.get("http://blockr.io/api/v1/address/txs/#{params[:id]}")
    #@qr = RQRCode::QRCode.new @address_info_response['data']['address']
  end
end
