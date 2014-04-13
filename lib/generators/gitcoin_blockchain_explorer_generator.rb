class GitcoinBlockchainExplorerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    puts 'inject routes'
    route("get \"blockchain\"")
    route("get \"blockchain/search\"")
    route("get \"blockchain/block\"")
    route("get \"blockchain/transaction\"")
    route("get \"blockchain/address\"")
    #prepend_file 'config/routes.rb' do
    #  "\n get 'blockchain', to: 'blockchain#index'\n"
    #end
    #prepend_file 'config/routes.rb' do
    #  "\n post 'blockchain/search, to: 'blockchain#search'\n"
    #end
    #prepend_file 'config/routes.rb' do
    #  "\n get 'blockchain/block', to 'blockchain#block'\n"
    #end
    #prepend_file 'config/routes.rb' do
    #  "\n get 'blockchain/transaction', to 'blockchain#transaction'\n"
    #end
    #prepend_file 'config/routes.rb' do
    #  "\n get 'blockchain/address', to 'blockchain#address'\n"
    #end

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
