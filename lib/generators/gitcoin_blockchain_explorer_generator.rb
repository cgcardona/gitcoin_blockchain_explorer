class GitcoinBlockchainExplorerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    puts 'inject routes'
    route("get 'blockchain', to: 'blockchain#index'")
    route("get 'blockchain/search/:id', to: 'blockchain#search'")
    route("get 'blockchain/block', to: 'blockchain#block'")
    route("get 'blockchain/transaction', to: 'blockchain#transaction'")
    route("get 'blockchain/address', to: 'blockchain#address'")

    puts 'Create controller and views'
    ['blockchain_controller', 'index', 'search', 'block', 'transaction'].each_with_index do |page, index|
      if index == 0
        puts 'blockchain controller'
        copy_file 'blockchain_controller.rb', 'app/controllers/blockchain_controller.rb'
      else
        puts "#{page} view"
        copy_file "#{page}.html.haml", "app/views/blockchain_controller/#{page}.html.haml"
      end
    end
  end
end
