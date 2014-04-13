class GitcoinBlockchainExplorerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    puts 'inject routes'
    route("get 'blockchain', to: 'blockchain#index'")
    route("post 'blockchain/search', to: 'blockchain#search'")
    route("get 'block/:id', to: 'blockchain#block'")
    route("get 'transaction/:id', to: 'blockchain#transaction'")
    route("get 'address/:id', to: 'blockchain#address'")

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
