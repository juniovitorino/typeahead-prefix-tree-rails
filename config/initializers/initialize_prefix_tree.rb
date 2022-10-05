# frozen_string_literal: true

require Rails.root.join('app', 'services', 'prefix_tree_importer')

JSON_FILE = Rails.root.join('storage', 'names.json')
PREFIX_TREE = PrefixTreeImporter.new(JSON_FILE).import!
