# frozen_string_literal: true

require 'tree'

# Class Prefix Tree Importer
class PrefixTreeImporter
  CHUNK_MAX_SIZE = 1024

  def call; end

  def initialize(file_path)
    @file_chunks = StringIO.new
    @file = file_path
    @tree = Tree.new
  end

  def import!
    File.open(@file).each(nil, CHUNK_MAX_SIZE) do |chunk|
      @file_chunks << chunk
    end
    parse_json
  rescue Errno::ENOENT => e
    puts "Error: #{e}"
  end

  private

  def parse_json
    data = JSON.parse(@file_chunks.string)
    data.each do |key, _value|
      @tree.insert(key)
    end
    @tree
  end
end
