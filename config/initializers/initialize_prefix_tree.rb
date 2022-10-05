# frozen_string_literal: true

require Rails.root.join('app', 'services', 'prefix_tree', 'prefix_tree_service.rb')
JSON_FILE = Rails.root.join('storage', 'names.json')

PREFIX_TREE = Services::PrefixTree::PrefixTreeService.new(JSON_FILE).call
